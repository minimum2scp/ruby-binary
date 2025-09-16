RSpec.shared_examples 'ruby 3.4.6' do
  describe command("RBENV_VERSION=3.4.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.6 (2025-09-16 revision dbd83256b1) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.7.2\n" }
  end

  describe command("RBENV_VERSION=3.4.6 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.7.2)\n" }
  end

  describe command("RBENV_VERSION=3.4.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.6/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.6 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.3.9' do
  describe command("RBENV_VERSION=3.3.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.9 (2025-07-24 revision f5c772fc7c) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.7.2\n" }
  end

  describe command("RBENV_VERSION=3.3.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.7.2)\n" }
  end

  describe command("RBENV_VERSION=3.3.9 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.9/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.9 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.2.9' do
  describe command("RBENV_VERSION=3.2.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.9 (2025-07-24 revision 8f611e0c46) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.7.2\n" }
  end

  describe command("RBENV_VERSION=3.2.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.7.2)\n" }
  end

  describe command("RBENV_VERSION=3.2.9 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.2.9/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.2.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.9 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.9 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

