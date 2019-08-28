require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.6.4"

describe "platform=stretch-amd64 version=2.6.4" do
  describe command("RBENV_VERSION=2.6.4 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.4 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.6\n" }
  end

  describe command("RBENV_VERSION=2.6.4 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.2\n" }
  end

  describe command("RBENV_VERSION=2.6.4 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.4 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.0/ }
  end

  describe command("RBENV_VERSION=2.6.4 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

