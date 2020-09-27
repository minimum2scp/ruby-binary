require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_buster-amd64_3.0.0-preview1"

describe "platform=buster-amd64 version=3.0.0-preview1" do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('10.') }
  end

  describe command("RBENV_VERSION=3.0.0-preview1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.0preview1 (2020-09-25 master 0096d2b895) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.0.rc.1\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview1 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.0.rc.1, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.0-preview1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=3.0.0-preview1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

