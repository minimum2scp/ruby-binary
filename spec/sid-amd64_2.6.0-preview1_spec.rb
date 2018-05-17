require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.6.0-preview1"

describe "platform=sid-amd64 version=2.6.0-preview1" do
  describe command("RBENV_VERSION=2.6.0-preview1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.0preview1 (2018-02-24 trunk 62554) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.0-preview1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.7.6\n" }
  end

  describe command("RBENV_VERSION=2.6.0-preview1 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.2\n" }
  end

  describe command("RBENV_VERSION=2.6.0-preview1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.0-preview1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end
end

