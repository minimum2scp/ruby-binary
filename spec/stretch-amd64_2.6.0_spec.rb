require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.6.0"

describe "platform=stretch-amd64 version=2.6.0" do
  describe command("RBENV_VERSION=2.6.0 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.0 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.1\n" }
  end

  describe command("RBENV_VERSION=2.6.0 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.1\n" }
  end

  describe command("RBENV_VERSION=2.6.0 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.0 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end
end

