require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.5.5"

describe "platform=sid-amd64 version=2.5.5" do
  describe command("RBENV_VERSION=2.5.5 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.5p157 (2019-03-15 revision 67260) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.5 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.0.3\n" }
  end

  describe command("RBENV_VERSION=2.5.5 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 2.0.2\n" }
  end

  describe command("RBENV_VERSION=2.5.5 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.5 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.1\.1/ }
  end

  describe command("RBENV_VERSION=2.5.5 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

