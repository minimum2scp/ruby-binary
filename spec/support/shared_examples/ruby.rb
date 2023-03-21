RSpec.shared_examples 'ruby 3.2.1' do
  describe command("RBENV_VERSION=3.2.1 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.2.1 (2023-02-08 revision 31819e82c8) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.2.1 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.4.9\n" }
  end

  describe command("RBENV_VERSION=3.2.1 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.4.9, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.2.1 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.2.1 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.2.1 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.2.1 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.2.1 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.1.3' do
  describe command("RBENV_VERSION=3.1.3 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.1.3p185 (2022-11-24 revision 1a6b16756e) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.1.3 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.4.9\n" }
  end

  describe command("RBENV_VERSION=3.1.3 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.4.9, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.1.3 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.1.3 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.1.3 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end

  describe command("RBENV_VERSION=3.1.3 ruby --mjit -e 'p RubyVM::MJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end

  describe command("RBENV_VERSION=3.1.3 ruby --yjit -e 'p RubyVM::YJIT.enabled?'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "true\n" }
    its(:stderr){ should eq '' }
  end
end

RSpec.shared_examples 'ruby 3.0.5' do
  describe command("RBENV_VERSION=3.0.5 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.5p211 (2022-11-24 revision ba5cf0f7c5) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.5 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.4.9\n" }
  end

  describe command("RBENV_VERSION=3.0.5 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.4.9, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.5 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.5 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.0.5 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.7.7' do
  describe command("RBENV_VERSION=2.7.7 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.7p221 (2022-11-24 revision 168ec2b1e5) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.7 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.4.9\n" }
  end

  describe command("RBENV_VERSION=2.7.7 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.4.9, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.7.7 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.7 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.7.7 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

