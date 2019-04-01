require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.4.6"

describe "platform=sid-amd64 version=2.4.6" do
  describe command("RBENV_VERSION=2.4.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.4.6p354 (2019-04-01 revision 67394) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.4.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.3\n" }
  end

  describe command("RBENV_VERSION=2.4.6 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.1\n" }
  end

  describe command("RBENV_VERSION=2.4.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.4.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.4.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

