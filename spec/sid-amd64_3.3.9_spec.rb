set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_3.3.9"

describe "platform=sid-amd64 version=3.3.9" do
  include_context 'openssl 3.5.1'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 3.3.9'
end

