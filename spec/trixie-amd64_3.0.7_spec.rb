set :docker_image, "minimum2scp/ruby-binary:test_trixie-amd64_3.0.7"

describe "platform=trixie-amd64 version=3.0.7" do
  include_context 'openssl 1.1.1'
  it_behaves_like 'debian trixie'
  it_behaves_like 'ruby 3.0.7'
end

