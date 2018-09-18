require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.4.4"

describe "platform=sid-amd64 version=2.4.4" do
  describe command("RBENV_VERSION=2.4.4 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.4.4p296 (2018-03-28 revision 63013) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.4.4 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.6.14.1\n" }
  end

  describe command("RBENV_VERSION=2.4.4 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.5\n" }
  end

  describe command("RBENV_VERSION=2.4.4 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.4.4 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end
end

