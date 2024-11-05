set :docker_image, "minimum2scp/ruby-binary:test_bookworm-amd64_3.2.6"

describe "platform=bookworm-amd64 version=3.2.6" do
  include_context 'openssl 3.0.14'
  it_behaves_like 'debian bookworm'
  it_behaves_like 'ruby 3.2.6'
end

