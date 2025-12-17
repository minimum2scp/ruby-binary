set :docker_image, "minimum2scp/ruby-binary:test_trixie-amd64_3.4.8"

describe "platform=trixie-amd64 version=3.4.8" do
  include_context 'openssl 3.5.4'
  it_behaves_like 'debian trixie'
  it_behaves_like 'ruby 3.4.8'
end

