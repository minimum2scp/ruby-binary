require "spec_helper"

set :docker_image, "minimum2scp/ruby-binary:test_stretch-amd64_2.5.8"

describe "platform=stretch-amd64 version=2.5.8" do
  include_context 'openssl 1.1.0'
  it_behaves_like 'debian stretch'
  it_behaves_like 'ruby 2.5.8'
end

