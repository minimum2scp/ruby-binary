RSpec.shared_examples 'ruby 3.0.1' do
  describe command("RBENV_VERSION=3.0.1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.22\n" }
  end

  describe command("RBENV_VERSION=3.0.1 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.22, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.0.1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.7.3' do
  describe command("RBENV_VERSION=2.7.3 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.3p183 (2021-04-05 revision 6847ee089d) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.3 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.22\n" }
  end

  describe command("RBENV_VERSION=2.7.3 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.22, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.7.3 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.3 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.7.3 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.6.7' do
  describe command("RBENV_VERSION=2.6.7 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.7p197 (2021-04-05 revision 67941) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.7 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.22\n" }
  end

  describe command("RBENV_VERSION=2.6.7 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.22, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.6.7 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.7 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.6.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.5.9' do
  describe command("RBENV_VERSION=2.5.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.9p229 (2021-04-05 revision 67939) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.22\n" }
  end

  describe command("RBENV_VERSION=2.5.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.22, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.5.9 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.9 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.5.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

