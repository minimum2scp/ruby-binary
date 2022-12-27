set :docker_image, "minimum2scp/ruby-binary:test_bullseye-amd64_3.2.0"

describe "platform=bullseye-amd64 version=3.2.0" do
  include_context 'openssl 1.1.1'
  include_context 'no rust'
  it_behaves_like 'debian bullseye'
  it_behaves_like 'ruby 3.2.0'
end
