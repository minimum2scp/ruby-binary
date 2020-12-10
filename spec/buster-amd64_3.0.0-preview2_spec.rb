require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_buster-amd64_3.0.0-preview2"

describe "platform=buster-amd64 version=3.0.0-preview2" do
  it_behaves_like 'debian buster'
  it_behaves_like 'ruby 3.0.0-preview2'

  describe command("RBENV_VERSION=3.0.0-preview2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with('OpenSSL 1.1.1') }
  end
end

