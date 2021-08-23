set :docker_image, "minimum2scp/ruby-binary:test_bullseye-amd64_2.5.9"

describe "platform=bullseye-amd64 version=2.5.9" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian bullseye'
  it_behaves_like 'ruby 2.5.9'
end

