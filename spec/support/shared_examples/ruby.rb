RSpec.shared_examples 'ruby 3.3.2' do
  describe command("RBENV_VERSION=3.3.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.2 (2024-05-30 revision e5a195edf6) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.11\n" }
  end

  describe command("RBENV_VERSION=3.3.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.11)\n" }
  end

  describe command("RBENV_VERSION=3.3.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.3.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.2/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.2 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.2.4' do
  describe command("RBENV_VERSION=3.2.4 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.4 (2024-04-23 revision af471c0e01) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.4 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.11\n" }
  end

  describe command("RBENV_VERSION=3.2.4 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.11)\n" }
  end

  describe command("RBENV_VERSION=3.2.4 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.2.4 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.2.4/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.2.4 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.4 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.4 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.1.6' do
  describe command("RBENV_VERSION=3.1.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.1.6p260 (2024-05-29 revision a777087be6) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.1.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.11\n" }
  end

  describe command("RBENV_VERSION=3.1.6 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.11)\n" }
  end

  describe command("RBENV_VERSION=3.1.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe file("/opt/rbenv/versions/3.1.6/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.1.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.1.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.1.6 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.1.6 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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
    its(:stdout){ should eq "3.5.11\n" }
  end

  describe command("RBENV_VERSION=3.0.7 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.11)\n" }
  end

  describe command("RBENV_VERSION=3.0.7 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe file("/opt/rbenv/versions/3.0.7/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.0.7 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.0.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.7.8' do
  describe command("RBENV_VERSION=2.7.8 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.8p225 (2023-03-30 revision 1f4d455848) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.8 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.4.22\n" }
  end

  describe command("RBENV_VERSION=2.7.8 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.4.22)\n" }
  end

  describe command("RBENV_VERSION=2.7.8 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.8 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/2.7.8/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=2.7.8 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

