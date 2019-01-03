require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.4.5"

describe "platform=sid-amd64 version=2.4.5" do
  describe command("RBENV_VERSION=2.4.5 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.4.5p335 (2018-10-18 revision 65137) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.4.5 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.6.14.3\n" }
  end

  describe command("RBENV_VERSION=2.4.5 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.0\n" }
  end

  describe command("RBENV_VERSION=2.4.5 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.4.5 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end
end

