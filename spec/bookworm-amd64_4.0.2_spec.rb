set :docker_image, "minimum2scp/ruby-binary:test_bookworm-amd64_4.0.2"

describe "platform=bookworm-amd64 version=4.0.2" do
  include_context 'openssl 3.0.19'
  it_behaves_like 'debian bookworm'
  it_behaves_like 'ruby 4.0.2'
end

