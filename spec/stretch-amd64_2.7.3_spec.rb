set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.7.3"

describe "platform=stretch-amd64 version=2.7.3" do
  include_context 'openssl 1.1.0'
  it_behaves_like 'debian stretch'
  it_behaves_like 'ruby 2.7.3'
end

