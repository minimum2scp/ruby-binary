set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_3.3.0"

describe "platform=sid-amd64 version=3.3.0" do
  include_context 'openssl 3.1.4'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 3.3.0'
end

