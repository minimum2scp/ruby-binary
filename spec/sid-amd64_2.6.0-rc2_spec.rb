require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.6.0-rc2"

describe "platform=sid-amd64 version=2.6.0-rc2" do
  describe command("RBENV_VERSION=2.6.0-rc2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.0rc2 (2018-12-15 trunk 66408) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.0-rc2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.0.beta3\n" }
  end

  describe command("RBENV_VERSION=2.6.0-rc2 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.17.2\n" }
  end

  describe command("RBENV_VERSION=2.6.0-rc2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.0-rc2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end
end

