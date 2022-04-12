RSpec.shared_examples 'ruby 3.1.2' do
  describe command("RBENV_VERSION=3.1.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.1.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.3.11\n" }
  end

  describe command("RBENV_VERSION=3.1.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.3.11, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.1.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.1.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.1.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 3.0.4' do
  describe command("RBENV_VERSION=3.0.4 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.4p208 (2022-04-12 revision 3fa771dded) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.4 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.3.11\n" }
  end

  describe command("RBENV_VERSION=3.0.4 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.3.11, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.4 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.4 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.0.4 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.7.6' do
  describe command("RBENV_VERSION=2.7.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.6p219 (2022-04-12 revision c9c2245c0a) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.3.11\n" }
  end

  describe command("RBENV_VERSION=2.7.6 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.3.11, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.7.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.7.6 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.6.10' do
  describe command("RBENV_VERSION=2.6.10 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.10p210 (2022-04-12 revision 67958) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.10 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.3.11\n" }
  end

  describe command("RBENV_VERSION=2.6.10 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.3.11, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.6.10 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.10 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.6.10 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

