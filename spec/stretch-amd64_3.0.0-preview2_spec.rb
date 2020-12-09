require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_3.0.0-preview2"

describe "platform=stretch-amd64 version=3.0.0-preview2" do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('9.') }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.0preview2 (2020-12-08 master d7a16670c3) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.0\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.0, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

