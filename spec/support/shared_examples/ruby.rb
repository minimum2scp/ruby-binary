RSpec.shared_examples 'ruby 4.0.9' do
  describe command("RBENV_VERSION=4.0.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 4.0.9 (2026-10-23 revision 3e93b23afc) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=4.0.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.23\n" }
  end

  describe command("RBENV_VERSION=4.0.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.23)\n" }
  end

  describe command("RBENV_VERSION=4.0.9 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/4.0.9/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=4.0.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=4.0.9 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.4.12' do
  describe command("RBENV_VERSION=3.4.12 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.12 (2026-10-23 revision 366f5fdc00) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.12 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.23\n" }
  end

  describe command("RBENV_VERSION=3.4.12 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.23)\n" }
  end

  describe command("RBENV_VERSION=3.4.12 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.12/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.12 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.12 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.3.13' do
  describe command("RBENV_VERSION=3.3.13 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.13 (2026-10-23 revision af48f08f21) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.13 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.23\n" }
  end

  describe command("RBENV_VERSION=3.3.13 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.23)\n" }
  end

  describe command("RBENV_VERSION=3.3.13 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.13/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.13 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.13 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.2.11' do
  describe command("RBENV_VERSION=3.2.11 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.11 (2026-03-27 revision 5483bfc1ae) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.11 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.23\n" }
  end

  describe command("RBENV_VERSION=3.2.11 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.23)\n" }
  end

  describe command("RBENV_VERSION=3.2.11 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.2.11/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.2.11 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.11 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.11 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

