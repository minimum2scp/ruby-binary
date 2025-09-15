set :docker_image, "minimum2scp/ruby-binary:test_trixie-amd64_3.4.5"

describe "platform=trixie-amd64 version=3.4.5" do
  include_context 'openssl 3.5.1'
  it_behaves_like 'debian trixie'
  it_behaves_like 'ruby 3.4.5'
end

