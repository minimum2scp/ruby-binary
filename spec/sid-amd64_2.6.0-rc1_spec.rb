require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.6.0-rc1"

describe "platform=sid-amd64 version=2.6.0-rc1" do
  describe command("RBENV_VERSION=2.6.0-rc1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.0rc1 (2018-12-06 trunk 66253) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.0-rc1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.0.beta3\n" }
  end

  describe command("RBENV_VERSION=2.6.0-rc1 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.0\n" }
  end

  describe command("RBENV_VERSION=2.6.0-rc1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.0-rc1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end
end

