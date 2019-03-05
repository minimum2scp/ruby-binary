require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.6.1"

describe "platform=stretch-amd64 version=2.6.1" do
  describe command("RBENV_VERSION=2.6.1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.1p33 (2019-01-30 revision 66950) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.3\n" }
  end

  describe command("RBENV_VERSION=2.6.1 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.1\n" }
  end

  describe command("RBENV_VERSION=2.6.1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end

  describe command("RBENV_VERSION=2.6.1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

