require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_buster-amd64_2.6.6"

describe "platform=buster-amd64 version=2.6.6" do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('10.') }
  end

  describe command("RBENV_VERSION=2.6.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.1.3\n" }
  end

  describe command("RBENV_VERSION=2.6.6 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.1.4, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.6.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.6.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

