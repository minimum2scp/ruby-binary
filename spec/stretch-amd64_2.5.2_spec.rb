require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.5.2"

describe "platform=stretch-amd64 version=2.5.2" do
  describe command("RBENV_VERSION=2.5.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.2p104 (2018-10-18 revision 65133) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.7.6\n" }
  end

  describe command("RBENV_VERSION=2.5.2 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.6\n" }
  end

  describe command("RBENV_VERSION=2.5.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.2/ }
  end
end

