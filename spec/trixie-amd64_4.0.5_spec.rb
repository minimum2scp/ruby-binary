set :docker_image, "minimum2scp/ruby-binary:test_trixie-amd64_4.0.5"

describe "platform=trixie-amd64 version=4.0.5" do
  include_context 'openssl 3.5.6'
  it_behaves_like 'debian trixie'
  it_behaves_like 'ruby 4.0.5'
end

