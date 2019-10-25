require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.7.0-preview2"

describe "platform=sid-amd64 version=2.7.0-preview2" do
  describe command("RBENV_VERSION=2.7.0-preview2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.0preview2 (2019-10-22 master 02aadf1032) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.0-preview2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.1.0.pre2\n" }
  end

  describe command("RBENV_VERSION=2.7.0-preview2 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.1.0.pre.2\n" }
  end

  describe command("RBENV_VERSION=2.7.0-preview2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.0-preview2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.7.0-preview2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end
