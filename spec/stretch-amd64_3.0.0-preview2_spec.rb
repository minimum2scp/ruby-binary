require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_3.0.0-preview2"

describe "platform=stretch-amd64 version=3.0.0-preview2" do
  it_behaves_like 'debian stretch'
  it_behaves_like 'ruby 3.0.0-preview2'

  describe command("RBENV_VERSION=3.0.0-preview2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with('OpenSSL 1.1.0') }
  end
end

