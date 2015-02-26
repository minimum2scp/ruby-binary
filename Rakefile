require 'rake/clean'
require 'etc'

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

desc "release to github"
task :release, :tag do |t,args|
  sh "ghr -u minimum2scp -r ruby-binary --draft --replace #{args[:tag]} files/binary/*.tar.gz"
end

