set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_4.0.0"

describe "platform=sid-amd64 version=4.0.0" do
  include_context 'openssl 3.5.4'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 4.0.0'
end

