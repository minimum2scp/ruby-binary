require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.5.8"

describe "platform=stretch-amd64 version=2.5.8" do
  it_behaves_like 'debian stretch'
  it_behaves_like 'ruby 2.5.8'

  describe command("RBENV_VERSION=2.5.8 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with('OpenSSL 1.1.0') }
  end
end

