require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.6.5"

describe "platform=sid-amd64 version=2.6.5" do
  describe file('/etc/debian_version') do
    its(:content){ should eq "bullseye/sid\n" }
  end

  describe command("RBENV_VERSION=2.6.5 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.5 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.1.2\n" }
  end

  describe command("RBENV_VERSION=2.6.5 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.1.2, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.6.5 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.5 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.6.5 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

