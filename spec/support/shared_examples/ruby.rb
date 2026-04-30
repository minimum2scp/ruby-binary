RSpec.shared_examples 'ruby 4.0.3' do
  describe command("RBENV_VERSION=4.0.3 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 4.0.3 (2026-04-21 revision 85ddef263a) +PRISM [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=4.0.3 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.11\n" }
  end

  describe command("RBENV_VERSION=4.0.3 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.11)\n" }
  end

  describe command("RBENV_VERSION=4.0.3 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/4.0.3/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=4.0.3 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=4.0.3 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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
    its(:stdout){ should eq "4.0.11\n" }
  end

  describe command("RBENV_VERSION=3.4.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.11)\n" }
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

RSpec.shared_examples 'ruby 3.3.11' do
  describe command("RBENV_VERSION=3.3.11 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.3.11 (2026-03-26 revision 1f2d15125a) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.3.11 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "4.0.11\n" }
  end

  describe command("RBENV_VERSION=3.3.11 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.11)\n" }
  end

  describe command("RBENV_VERSION=3.3.11 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe file("/opt/rbenv/versions/3.3.11/openssl") do
    it { should_not exist }
  end

  describe command("RBENV_VERSION=3.3.11 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.3.11 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
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
    its(:stdout){ should eq "4.0.11\n" }
  end

  describe command("RBENV_VERSION=3.2.11 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 4.0.11)\n" }
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

