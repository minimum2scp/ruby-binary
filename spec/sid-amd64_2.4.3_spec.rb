require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.4.3"

describe "platform=sid-amd64 version=2.4.3" do
  describe command("RBENV_VERSION=2.4.3 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.4.3p205 (2017-12-14 revision 61247) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.4.3 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.6.14\n" }
  end

  describe command("RBENV_VERSION=2.4.3 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.1\n" }
  end

  describe command("RBENV_VERSION=2.4.3 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.4.3 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end
end

