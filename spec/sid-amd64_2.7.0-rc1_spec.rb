require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.7.0-rc1"

describe "platform=sid-amd64 version=2.7.0-rc1" do
  describe file('/etc/debian_version') do
    its(:content){ should eq "bullseye/sid\n" }
  end

  describe command("RBENV_VERSION=2.7.0-rc1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.0rc1 (2019-12-18 master 8a40dce0ff) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.0-rc1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.1.1\n" }
  end

  describe command("RBENV_VERSION=2.7.0-rc1 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.1.1\n" }
  end

  describe command("RBENV_VERSION=2.7.0-rc1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.0-rc1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.7.0-rc1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

