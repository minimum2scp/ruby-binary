RSpec.shared_examples 'ruby 3.4.5' do
  describe command("RBENV_VERSION=3.4.5 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.5 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.7.2\n" }
  end

  describe command("RBENV_VERSION=3.4.5 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.7.2)\n" }
  end

  describe command("RBENV_VERSION=3.4.5 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.5/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.5 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.5 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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

