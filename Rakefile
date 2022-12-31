require 'rake/clean'
require 'cgi'
require 'etc'
require 'tmpdir'
require 'open-uri'
require 'uri'
require 'json'
require 'yaml'
require 'erb'

TARBALLS = FileList["files/binary/*.tar.gz", "files/log/*.log"]
CLEAN.include(TARBALLS)
CLEAN.include(FileList['files/tmp/**'])
BUILD_CONFIG = if File.exist? 'build-config.yml'
                 YAML.load(File.read('build-config.yml'))
               else
                 { 'targets' => [] }
               end

## colorize: see lib/rake/file_utils_ext.rb
def Rake.rake_output_message(message)
  $stderr.puts "\e[32;1m#{message}\e[0m"
end

## coloreize: see fileutils.rb
module FileUtils
  alias fu_output_message_orig fu_output_message

  def fu_output_message(msg)
    fu_output_message_orig("\e[32;1m#{msg}\e[0m")
  end
  private_module_function :fu_output_message
end

task :default => "build:all"

desc 'Generate build-config.yml from build-config.yml.erb'
file 'build-config.yml' => ['build-config.yml.erb'] do |t,args|
  File.open(t.name, 'w') do |fh|
    fh << ERB.new(File.read(t.prerequisites[0]), trim_mode: '-').result
  end
end

namespace :build do
  desc "prepare all docker images"
  task :prepare do
    BUILD_CONFIG['targets'].map{|target| target['platform']}.uniq.each do |platform|
      Rake::Task["build:#{platform}:prepare"].invoke
    end
  end

  desc "build all ruby binaries defined in build-config.yml"
  task :all do
    BUILD_CONFIG["targets"].each.with_index do |target, idx|
      platform = target['platform']
      version = target['version']
      Rake::Task["build:#{platform}:#{version}"].invoke
    end
  end

  BUILD_CONFIG['targets'].group_by{ |target| target['platform'] }.each do |platform, targets|
    namespace platform do
      desc "prepare docker image for #{platform}"
      task :prepare do
        images = targets.map{|target| target['image']}.uniq
        images.each do |image|
          sh "docker pull #{image}"
        end
      end

      targets.each do |target|
        image         = target['image']
        version       = target['version']
        envs          = target['envs'] || {}
        src           = target['src']
        patches       = target['patches'] || []
        before_build  = target['before_build'] || []
        after_build   = target['after_build'] || []
        tarball       = {remote: "/data/binary/ruby-binary_#{platform}_#{version}.tar.gz", local: "files/binary/ruby-binary_#{platform}_#{version}.tar.gz"}
        log           = {remote: "/data/log/ruby-binary_#{platform}_#{version}.log",       local: "files/log/ruby-binary_#{platform}_#{version}.log"}
        build_script  = {remote: "/data/tmp/build_#{platform}_#{version}",                 local: "files/tmp/build_#{platform}_#{version}" }

        if target['openssl']
          openssl = {
            version: target['openssl']['version'],
            remote: "/data/binary/openssl-#{target['openssl']['version']}_#{platform}_#{version}.tar.gz",
            local: "files/binary/openssl-#{target['openssl']['version']}_#{platform}_#{version}.tar.gz",
          }
        else
          openssl = nil
        end

        file build_script[:local] => ['files/scripts/build.sh.erb', 'build-config.yml'] do |t, args|
          File.open(t.name, 'w') do |fh|
            build_config = {
              version:      version,
              log:          log,
              tarball:      tarball,
              src:          src,
              patches:      patches,
              before_build: before_build,
              after_build:  after_build,
              openssl:      openssl,
            }
            fh << ERB.new(File.read(t.prerequisites[0]), trim_mode: '-').result(binding)
          end
          chmod "u+x", t.name
        end

        file tarball[:local] do
          Rake::Task["build:#{platform}:#{version}"].invoke
        end

        desc "build ruby #{version} with docker image #{image} (platform: #{platform})"
        task version, [] => ["build:#{platform}:prepare", build_script[:local]] do |t,args|
          container_name = "ruby_#{platform}_#{version}"
          data_volume_name = "data_ruby_#{platform}_#{version}"
          opts = [ "--name=#{container_name}", "-v #{data_volume_name}:/data" ]
          opts += envs.map{|k,v| "-e #{k}=\"#{v}\""}
          sh "docker volume create #{data_volume_name}"
          sh "docker run --rm #{opts.join(' ')} #{image} mkdir /data/binary /data/log /data/tmp"
          sh "docker create #{opts.join(' ')} #{image} #{build_script[:remote]}"
          sh "docker cp #{build_script[:local]} #{container_name}:#{build_script[:remote]}"
          sh "docker cp files/patches/ #{container_name}:/data/patches/"
          begin
            sh "docker start -a #{container_name}"
          ensure
            sh "docker cp #{container_name}:#{log[:remote]} #{log[:local]}"
          end
          sh "docker cp #{container_name}:#{tarball[:remote]} #{tarball[:local]}"
          if openssl
            sh "docker cp #{container_name}:#{openssl[:remote]} #{openssl[:local]}"
          end
          sh "docker rm #{container_name}"
          sh "docker volume rm #{data_volume_name}"
        end
      end
    end
  end
end

namespace :test do
  desc "test all binaries with container"
  task :all => BUILD_CONFIG["targets"].map{|target| "test:#{target['platform']}:#{target['version']}" }

  BUILD_CONFIG['targets'].group_by{ |target| target['platform'] }.each do |platform, targets|
    namespace platform do
      targets.each do |target|
        image         = target['image']
        version       = target['version']
        tarball       = {local: "files/binary/ruby-binary_#{platform}_#{version}.tar.gz"}
        dockerfile    = {local: "files/tmp/Dockerfile_#{platform}_#{version}" }
        test_image    = "minimum2scp/ruby-binary:test_#{platform}_#{version}"

        if target['openssl']
          openssl = {
            local: "files/binary/openssl-#{target['openssl']['version']}_#{platform}_#{version}.tar.gz",
          }
        else
          openssl = nil
        end

        file dockerfile[:local] => ['files/scripts/Dockerfile.erb', 'build-config.yml'] do |t, args|
          File.open(t.name, 'w') do |fh|
            fh << ERB.new(File.read(t.prerequisites[0]), trim_mode: '-').result(binding)
          end
        end

        desc "test ruby #{version} (platform: #{platform})"
        task version, [] => [tarball[:local], dockerfile[:local]] do
          sh "docker build -t #{test_image} -f #{dockerfile[:local]} ."
          sh "bundle exec rspec -f d spec/#{platform}_#{version}_spec.rb"
        end
      end
    end
  end
end

def get_github_release(user, repos, tag, prerelease=false)
  if prerelease
    releases = JSON.parse URI.open("https://api.github.com/repos/#{user}/#{repos}/releases").read
    releases.sort_by{|rel| rel['published_at']}.last
  elsif tag && !tag.empty?
    JSON.parse URI.open("https://api.github.com/repos/#{user}/#{repos}/releases/tags/#{tag}").read
  else
    JSON.parse URI.open("https://api.github.com/repos/#{user}/#{repos}/releases/latest").read
  end
end

namespace :install do
  namespace :github_release do
    desc "list releases on github"
    task :list_releases do
      releases = JSON.parse URI.open('https://api.github.com/repos/minimum2scp/ruby-binary/releases').read
      releases.each do |rel|
        puts "%s (%s) assets: %s" % [
          rel['tag_name'], rel['published_at'],
          rel['assets'].map{|a| a['name']}.join(', ')
        ]
      end
    end

    desc "list assets url in a release with tag (or latest release if tag is omitted)"
    task :list_assets, [:tag] do |t, args|
      get_github_release('minimum2scp', 'ruby-binary', args.tag)['assets'].each do |asset|
        puts asset['browser_download_url']
      end
    end

    desc "install github released binary with a version"
    task :install, [:tag, :platform, :version] do |t, args|
      Dir.mktmpdir do |dir|
        cd dir, :verbose => true do
          asset = get_github_release('minimum2scp', 'ruby-binary', args.tag)['assets'].find{ |asset|
            asset['name'] =~ /\Aruby-binary_#{Regexp.quote(args.platform)}_#{Regexp.quote(args.version)}/
          }
          fail "No such asset in tag=#{args.tag}, platform=#{args.platform}, version=#{args.version}" unless asset
          name = asset['name']
          url = asset['browser_download_url']
          sh "curl -L -o #{name} #{url}"
          if File.directory?("/opt/rbenv/versions/#{args.version}")
            if ENV['RUBY_BINARY_INSTALL_FORCE'] =~ /^(1|on|true|yes)$/
              sh "sudo rm -rf /opt/rbenv/versions/#{args.version}"
            else
              abort "/opt/rbenv/versions/#{args.version} already exist (set env var RUBY_BINARY_INSTALL_FORCE to force install)"
            end
          end
          sh "sudo tar xf #{name} -C /opt/rbenv/versions"
          sh "sudo bash -l -c 'rbenv rehash'"
        end
      end
    end

    desc "install all versions of github released binary with tag (or latest release if omitted) and platform (or sid-amd64 if omitted)"
    task :install_all, [:tag, :platform, :version] do |t, args|
      get_github_release('minimum2scp', 'ruby-binary', args.tag)['assets'].each do |asset|
        platform, version = asset['name'].scan(/ruby-binary_([^_]+)_(\d+\.\d+\.\d+(?:-dev|-preview\d+|-rc\d+|-p\d+)?)/).first
        if platform == (args.platform || 'sid-amd64')
          Rake::Task['install:github_release:install'].invoke(args.tag, platform, version)
          Rake::Task['install:github_release:install'].reenable
        end
      end
    end
  end
end

namespace :rbenv do
  desc "install rbenv into /opt/rbenv"
  task :install do
    sh "install-rbenv.sh"
  end
end

