RSpec.shared_examples 'ruby 3.4.7' do
  describe command("RBENV_VERSION=3.4.7 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.7 (2025-10-08 revision 7a5688e2a2) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.7 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.7.2\n" }
  end

  describe command("RBENV_VERSION=3.4.7 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.7.2)\n" }
  end

  describe command("RBENV_VERSION=3.4.7 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.7/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.7 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.3.10' do
  describe command("RBENV_VERSION=3.3.10 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.10 (2025-10-23 revision 343ea05002) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.10 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.7.2\n" }
  end

  describe command("RBENV_VERSION=3.3.10 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.7.2)\n" }
  end

  describe command("RBENV_VERSION=3.3.10 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.10/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.10 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.10 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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

