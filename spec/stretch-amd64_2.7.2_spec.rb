require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.7.2"

describe "platform=stretch-amd64 version=2.7.2" do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('9.') }
  end

  describe command("RBENV_VERSION=2.7.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.1.5\n" }
  end

  describe command("RBENV_VERSION=2.7.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.1.4, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.7.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end

  describe command("RBENV_VERSION=2.7.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

