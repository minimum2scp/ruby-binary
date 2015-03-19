require 'rake/clean'
require 'cgi'
require 'etc'
require 'tmpdir'
require 'open-uri'
require 'uri'
require 'json'
require 'yaml'
require 'docker'
require 'pry'

TARBALLS = FileList["files/binary/*.tar.gz", "files/log/*.log"]
CLEAN.include(TARBALLS)
BUILD_CONFIG = YAML.load(File.read "build-config.yml")

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

desc "download artifacts from Circle CI, and create release on Github"
task :release, [:version] do |t, args|
  Dir.mktmpdir do |dir|
    token = ENV['CIRCLECI_TOKEN']
    branch = ENV['CIRCLECI_BRANCH'] || 'master'
    recent_build = JSON.parse(open("https://circleci.com/api/v1/project/minimum2scp/ruby-binary/tree/#{branch}?circle-token=#{token}&limit=20&offset=0&filter=completed").read)
    build_num = recent_build.first["build_num"]
    artifacts = JSON.parse(open("https://circleci.com/api/v1/project/minimum2scp/ruby-binary/#{build_num}/artifacts?circle-token=#{token}").read)
    artifacts.each do |a|
      local_name = File.basename(a["path"])
      next if local_name !~ /\.tar\.gz$/
      sh "curl -L -o #{dir}/#{File.basename(a["path"])} #{a["url"]}"
    end
    #binding.pry
    sh "ghr -u minimum2scp -r ruby-binary --draft #{args.version} #{dir}"
  end
end

namespace :build do
  volume = File.expand_path('files', __dir__)

  desc "prepare all docker containers"
  task :prepare do
    BUILD_CONFIG['targets'].each do |build_target|
      platform      = build_target['platform']
      Rake::Task["build:#{platform}:prepare"].invoke
    end
  end

  desc "build all ruby binaries defined in build-config.yml"
  task :all do
    BUILD_CONFIG["targets"].each.with_index do |target, idx|
      platform = target['platform']
      version = target['version']
      if ENV['CIRCLECI'] && ENV['CIRCLE_NODE_TOTAL'].to_i > 1
        if idx % ENV['CIRCLE_NODE_TOTAL'].to_i == ENV['CIRCLE_NODE_INDEX'].to_i
          Rake::Task["build:#{platform}:#{version}"].invoke
        end
      else
        Rake::Task["build:#{platform}:#{version}"].invoke
      end
    end
    Rake::Task["build:fixperm"].invoke
  end

  BUILD_CONFIG['targets'].each do |target|
    platform = target['platform']
    image    = target['image']
    version  = target['version']
    envs     = target['envs'] || {}
    tarball  = "/data/binary/ruby-binary_#{platform}_#{version}.tar.gz"
    log      = "/data/log/ruby-binary_#{platform}_#{version}.log"

    namespace platform do
      desc "prepare docker container #{image}"
      task :prepare do
        docker_image = ::Docker::Image.all.find{|img| img.info['RepoTags'].include?(image) }
        cache = File.expand_path("~/.cache/docker/#{CGI.escape(image)}.tar")
        if docker_image
          # image exists.
        elsif File.exist?(File.expand_path("~/.cache/docker/#{image}.tar"))
          # image is not pulled, but cache exists
          sh "docker load < #{cache}"
        else
          sh "docker pull #{image}"
          mkdir_p File.dirname(cache), :verbose => true
          sh "docker save #{image} > #{cache}"
        end
      end

      desc "build ruby #{version} with docker container #{image} (platform: #{platform})"
      task version, [] => ["build:#{platform}:prepare"] do |t,args|
        opts = [ '-ti', "-v #{volume}:/data" ]
        ## Circle CI build container has 32 vcpu cores, but nproc returns 2,
        ## and no need to delete container
        if ENV['CIRCLECI']
          envs['RUBY_MAKE_OPTS'] = "-j %d" % [`nproc`.chomp.to_i]
        else
          opts << '--rm'
        end
        cmd = "/data/scripts/build.sh #{version} #{tarball} #{log}"
        opts += envs.map{|k,v| "-e #{k}=\"#{v}\""}
        sh "docker run #{opts.join(' ')} #{image} #{cmd}"
      end
    end
  end

  desc "fix owner/group of build results"
  task :fixperm do
    user = Etc.getpwent
    sh "sudo chown -R #{user.uid}:#{user.gid} #{volume}/binary #{volume}/log"
  end

end

def get_github_release(user, repos, tag, prerelease=false)
  if prerelease
    releases = JSON.parse open("https://api.github.com/repos/#{user}/#{repos}/releases").read
    releases.sort_by{|rel| rel['published_at']}.last
  elsif tag
    JSON.parse open("https://api.github.com/repos/#{user}/#{repos}/releases/tags/#{tag}").read
  else
    JSON.parse open("https://api.github.com/repos/#{user}/#{repos}/releases/latest").read
  end
end

namespace :install do
  namespace :github_release do
    desc "list releases on github"
    task :list_relases do
      releases = JSON.parse open('https://api.github.com/repos/minimum2scp/ruby-binary/releases').read
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
    task :install, [:version, :url] do |t, args|
      name = File.basename(URI.parse(args.url).path)
      Dir.mktmpdir do |dir|
        cd dir, :verbose => true do
          sh "curl -L -o #{name} #{args.url}"
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
    task :install_all, [:tag, :platform] do |t, args|
      get_github_release('minimum2scp', 'ruby-binary', args.tag)['assets'].each do |asset|
        platform, version = asset['name'].scan(/ruby-binary_([^_]+)_(\d+\.\d+\.\d+(?:-dev|-preview\d+|-rc\d+|-p\d+)?)/).first
        if platform == (args.platform || 'sid-amd64')
          Rake::Task['install:github_release:install'].invoke(version, asset['browser_download_url'])
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

