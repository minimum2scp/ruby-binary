set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_3.2.1"

describe "platform=sid-amd64 version=3.2.1" do
  include_context 'openssl 3.0.8'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 3.2.1'
end

