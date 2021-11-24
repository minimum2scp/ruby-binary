set :docker_image, "minimum2scp/ruby-binary:test_buster-amd64_3.1.0-preview1"

describe "platform=buster-amd64 version=3.1.0-preview1" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian buster'
  it_behaves_like 'ruby 3.1.0-preview1'
end

