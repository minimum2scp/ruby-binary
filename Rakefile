require 'rake/clean'
require 'etc'
require 'tmpdir'
require 'open-uri'
require 'uri'
require 'json'

TARBALLS = FileList["files/binary/*.tar.gz", "files/log/*.log"]

CLEAN.include(TARBALLS)

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

task :default do
  Rake::Task['build:prepare'].invoke
  Rake::Task['build:run'].invoke
  Rake::Task['build:fixperm'].invoke
  Rake::Task['build:teardown'].invoke
end

namespace :build do
  cname = 'ruby-build-container'
  image = 'minimum2scp/ruby:latest'
  ruby_versions = %w[2.0.0-p643 2.1.5 2.2.0]
  volume = File.expand_path('files', __dir__)

  desc "prepare docker container"
  task :prepare do
    sh "if docker inspect #{image} 1>/dev/null 2>/dev/null; then :; else docker pull #{image}; fi"
  end

  desc "build ruby binaries in docker container"
  task :run do
    envs = {
      'RUBY_BINARY_VERSIONS' => ruby_versions.join(','),
      'RUBY_BINARY_DEST'     => '/data/binary',
      'RUBY_BINARY_LOG_DIR'  => '/data/log'
    }
    opts = [
      '-ti',
      "--name #{cname}",
      "-v #{volume}:/data",
      *envs.map{|k,v| ["-e #{k}=#{v}"] }
    ]
    cmd = '/data/scripts/build.sh'
    sh "docker run #{opts.join(' ')} #{image} #{cmd}"
  end

  desc "fix owner/group of build results"
  task :fixperm do
    user = Etc.getpwent
    sh "sudo chown -R #{user.uid}:#{user.gid} #{volume}/binary #{volume}/log"
  end

  desc "rm build container"
  task :teardown do
    unless ENV['CIRCLECI']
      sh "if docker inspect #{cname} 1>/dev/null 2>/dev/null; then docker rm -f #{cname}; fi"
    end
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

    desc "install all versions of github released binary with tag (or latest release if tag is omitted)"
    task :install_all, [:tag] do |t, args|
      get_github_release('minimum2scp', 'ruby-binary', args.tag)['assets'].each do |asset|
        version = asset['name'].scan(/ruby-(\d+\.\d+\.\d+(?:-dev|-preview\d+|-rc\d+|-p\d+)?)/).first.first
        Rake::Task['install:github_release:install'].invoke(version, asset['browser_download_url'])
        Rake::Task['install:github_release:install'].reenable
      end
    end
  end
end
