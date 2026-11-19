RSpec.shared_examples 'ruby 4.0.10' do
  describe command("RBENV_VERSION=4.0.10 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 4.0.10 (2026-11-19 revision a704b7cd95) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=4.0.10 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.1.0\n" }
  end

  describe command("RBENV_VERSION=4.0.10 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.1.0)\n" }
  end

  describe command("RBENV_VERSION=4.0.10 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/4.0.10/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=4.0.10 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=4.0.10 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.4.13' do
  describe command("RBENV_VERSION=3.4.13 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.13 (2026-11-19 revision 48857d6f2e) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.13 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.1.0\n" }
  end

  describe command("RBENV_VERSION=3.4.13 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.1.0)\n" }
  end

  describe command("RBENV_VERSION=3.4.13 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.13/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.13 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.13 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.3.14' do
  describe command("RBENV_VERSION=3.3.14 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.14 (2026-11-19 revision f4c37f481b) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.14 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.1.0\n" }
  end

  describe command("RBENV_VERSION=3.3.14 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.1.0)\n" }
  end

  describe command("RBENV_VERSION=3.3.14 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.14/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.14 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.14 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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
    its(:stdout){ should eq "4.1.0\n" }
  end

  describe command("RBENV_VERSION=3.2.11 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.1.0)\n" }
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

