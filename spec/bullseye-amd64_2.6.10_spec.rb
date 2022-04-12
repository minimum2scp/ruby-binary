set :docker_image, "minimum2scp/ruby-binary:test_bullseye-amd64_2.6.10"

describe "platform=bullseye-amd64 version=2.6.10" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian bullseye'
  it_behaves_like 'ruby 2.6.10'
end

