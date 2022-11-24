set :docker_image, "minimum2scp/ruby-binary:test_bullseye-amd64_3.0.5"

describe "platform=bullseye-amd64 version=3.0.5" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian bullseye'
  it_behaves_like 'ruby 3.0.5'
end

