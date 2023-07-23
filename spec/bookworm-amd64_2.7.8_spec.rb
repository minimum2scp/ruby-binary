set :docker_image, "minimum2scp/ruby-binary:test_bookworm-amd64_2.7.8"

describe "platform=bookworm-amd64 version=2.7.8" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian bookworm'
  it_behaves_like 'ruby 2.7.8'
end

