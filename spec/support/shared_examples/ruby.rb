RSpec.shared_examples 'ruby 3.4.2' do
  describe command("RBENV_VERSION=3.4.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.4.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.6.7\n" }
  end

  describe command("RBENV_VERSION=3.4.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.6.7)\n" }
  end

  describe command("RBENV_VERSION=3.4.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.4.2/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.4.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.4.2 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.3.8' do
  describe command("RBENV_VERSION=3.3.8 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.8 (2025-04-09 revision b200bad6cd) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.8 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.6.7\n" }
  end

  describe command("RBENV_VERSION=3.3.8 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.6.7)\n" }
  end

  describe command("RBENV_VERSION=3.3.8 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.8/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.8 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.8 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.2.8' do
  describe command("RBENV_VERSION=3.2.8 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.8 (2025-03-26 revision 13f495dc2c) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.8 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.6.7\n" }
  end

  describe command("RBENV_VERSION=3.2.8 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.6.7)\n" }
  end

  describe command("RBENV_VERSION=3.2.8 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.2.8/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.2.8 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.8 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.8 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.1.7' do
  describe command("RBENV_VERSION=3.1.7 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.1.7p261 (2025-03-26 revision 0a3704f218) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.1.7 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.6.7\n" }
  end

  describe command("RBENV_VERSION=3.1.7 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.6.7)\n" }
  end

  describe command("RBENV_VERSION=3.1.7 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.1.7/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.1.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.1.7 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.1.7 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.0.7' do
  describe command("RBENV_VERSION=3.0.7 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.7p220 (2024-04-23 revision 724a071175) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.7 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.23\n" }
  end

  describe command("RBENV_VERSION=3.0.7 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.23)\n" }
  end

  describe command("RBENV_VERSION=3.0.7 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.0.7/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.0.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

