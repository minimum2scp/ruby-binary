RSpec.shared_examples 'ruby 4.0.1' do
  describe command("RBENV_VERSION=4.0.1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 4.0.1 (2026-01-13 revision e04267a14b) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=4.0.1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.8\n" }
  end

  describe command("RBENV_VERSION=4.0.1 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.8)\n" }
  end

  describe command("RBENV_VERSION=4.0.1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/4.0.1/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=4.0.1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=4.0.1 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.4.9' do
  describe command("RBENV_VERSION=3.4.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.9 (2026-03-11 revision 76cca827ab) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.8\n" }
  end

  describe command("RBENV_VERSION=3.4.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.8)\n" }
  end

  describe command("RBENV_VERSION=3.4.9 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.9/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.9 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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
    its(:stdout){ should eq "4.0.8\n" }
  end

  describe command("RBENV_VERSION=3.3.10 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.8)\n" }
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

RSpec.shared_examples 'ruby 3.2.10' do
  describe command("RBENV_VERSION=3.2.10 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.10 (2026-01-14 revision a3a6d25788) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.10 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.8\n" }
  end

  describe command("RBENV_VERSION=3.2.10 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.8)\n" }
  end

  describe command("RBENV_VERSION=3.2.10 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.2.10/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.2.10 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.10 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.10 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

