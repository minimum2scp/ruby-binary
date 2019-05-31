require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.7.0-preview1"

describe "platform=sid-amd64 version=2.7.0-preview1" do
  describe command("RBENV_VERSION=2.7.0-preview1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.0preview1 (2019-05-31 trunk c55db6aa271df4a689dc8eb0039c929bf6ed43ff) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.0-preview1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.1.0.pre1\n" }
  end

  describe command("RBENV_VERSION=2.7.0-preview1 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.1.0.pre.1\n" }
  end

  describe command("RBENV_VERSION=2.7.0-preview1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.0-preview1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.7.0-preview1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

