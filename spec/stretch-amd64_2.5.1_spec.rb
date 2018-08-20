require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.5.1"

describe "platform=stretch-amd64 version=2.5.1" do
  describe command("RBENV_VERSION=2.5.1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.7.6\n" }
  end

  describe command("RBENV_VERSION=2.5.1 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.4\n" }
  end

  describe command("RBENV_VERSION=2.5.1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.2/ }
  end
end

