require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_jessie-amd64_2.5.3"

describe "platform=jessie-amd64 version=2.5.3" do
  describe command("RBENV_VERSION=2.5.3 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.3 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.7.6\n" }
  end

  describe command("RBENV_VERSION=2.5.3 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.17.1\n" }
  end

  describe command("RBENV_VERSION=2.5.3 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.3 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.1/ }
  end
end

