set :docker_image, "minimum2scp/ruby-binary:test_sid-amd64_2.5.8"

describe "platform=sid-amd64 version=2.5.8" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian sid'
  it_behaves_like 'ruby 2.5.8'
end

