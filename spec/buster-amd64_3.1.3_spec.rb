set :docker_image, "minimum2scp/ruby-binary:test_buster-amd64_3.1.3"

describe "platform=buster-amd64 version=3.1.3" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian buster'
  it_behaves_like 'ruby 3.1.3'
end

