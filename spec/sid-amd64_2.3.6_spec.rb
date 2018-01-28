require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.3.6"

describe "platform=sid-amd64 version=2.3.6" do
  describe command("RBENV_VERSION=2.3.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.3.6p384 (2017-12-14 revision 61254) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.3.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.5.2.2\n" }
  end

  describe command("RBENV_VERSION=2.3.6 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.1\n" }
  end

  describe command("RBENV_VERSION=2.3.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.3.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.2/ }
  end
end
