set :docker_image, "minimum2scp/ruby-binary:test_bookworm-amd64_3.3.9"

describe "platform=bookworm-amd64 version=3.3.9" do
  include_context 'openssl 3.0.17'
  it_behaves_like 'debian bookworm'
  it_behaves_like 'ruby 3.3.9'
end

