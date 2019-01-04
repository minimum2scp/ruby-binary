require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.3.8"

describe "platform=sid-amd64 version=2.3.8" do
  describe command("RBENV_VERSION=2.3.8 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.3.8p459 (2018-10-18 revision 65136) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.3.8 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.2\n" }
  end

  describe command("RBENV_VERSION=2.3.8 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.1\n" }
  end

  describe command("RBENV_VERSION=2.3.8 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.3.8 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.2/ }
  end
end

