RSpec.shared_examples 'ruby 3.2.2' do
  describe command("RBENV_VERSION=3.2.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.4\n" }
  end

  describe command("RBENV_VERSION=3.2.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.4)\n" }
  end

  describe command("RBENV_VERSION=3.2.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.2.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.2.2/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.2.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.2 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.2 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.1.4' do
  describe command("RBENV_VERSION=3.1.4 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.1.4p223 (2023-03-30 revision 957bb7cb81) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.1.4 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.4\n" }
  end

  describe command("RBENV_VERSION=3.1.4 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.4)\n" }
  end

  describe command("RBENV_VERSION=3.1.4 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe file("/opt/rbenv/versions/3.1.4/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.1.4 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.1.4 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.1.4 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.1.4 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.0.6' do
  describe command("RBENV_VERSION=3.0.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.6p216 (2023-03-30 revision 23a532679b) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.5.4\n" }
  end

  describe command("RBENV_VERSION=3.0.6 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.5.4)\n" }
  end

  describe command("RBENV_VERSION=3.0.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe file("/opt/rbenv/versions/3.0.6/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.0.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.0.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
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

