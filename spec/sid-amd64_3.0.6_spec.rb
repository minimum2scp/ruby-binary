set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_3.0.6"

describe "platform=sid-amd64 version=3.0.6" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 3.0.6'
end

