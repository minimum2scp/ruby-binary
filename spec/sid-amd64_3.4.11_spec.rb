set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_3.4.11"

describe "platform=sid-amd64 version=3.4.11" do
  include_context 'openssl 3.6.4'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 3.4.11'
end

