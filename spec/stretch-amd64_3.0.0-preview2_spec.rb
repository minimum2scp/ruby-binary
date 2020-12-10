set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_3.0.0-preview2"

describe "platform=stretch-amd64 version=3.0.0-preview2" do
  include_context 'openssl 1.1.0'
  it_behaves_like 'debian stretch'
  it_behaves_like 'ruby 3.0.0-preview2'
end

