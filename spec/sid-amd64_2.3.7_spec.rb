require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.3.7"

describe "platform=sid-amd64 version=2.3.7" do
  describe command("RBENV_VERSION=2.3.7 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.3.7p456 (2018-03-28 revision 63024) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.3.7 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "2.5.2.3\n" }
  end

  describe command("RBENV_VERSION=2.3.7 bundle -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "Bundler version 1.16.1\n" }
  end

  describe command("RBENV_VERSION=2.3.7 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.3.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should match /^OpenSSL 1\.0\.2/ }
  end
end

