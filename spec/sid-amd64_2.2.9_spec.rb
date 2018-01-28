require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.2.9"

describe "platform=sid-amd64 version=2.2.9" do
  describe command("RBENV_VERSION=2.2.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.2.9p480 (2017-12-15 revision 61259) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.2.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.4.5.4\n" }
  end

  describe command("RBENV_VERSION=2.2.9 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.1\n" }
  end

  describe command("RBENV_VERSION=2.2.9 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.2.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.2/ }
  end
end

