RSpec.shared_examples 'ruby 3.0.2' do
  describe command("RBENV_VERSION=3.0.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.23\n" }
  end

  describe command("RBENV_VERSION=3.0.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.23, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=3.0.2 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.7.4' do
  describe command("RBENV_VERSION=2.7.4 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.4 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.23\n" }
  end

  describe command("RBENV_VERSION=2.7.4 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.23, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.7.4 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.4 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.7.4 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.6.8' do
  describe command("RBENV_VERSION=2.6.8 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.8p205 (2021-07-07 revision 67951) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.8 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.23\n" }
  end

  describe command("RBENV_VERSION=2.6.8 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.23, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.6.8 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.8 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.6.8 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

RSpec.shared_examples 'ruby 2.5.9' do
  describe command("RBENV_VERSION=2.5.9 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.9p229 (2021-04-05 revision 67939) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.9 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.23\n" }
  end

  describe command("RBENV_VERSION=2.5.9 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.23, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.5.9 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.9 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end

  describe command("RBENV_VERSION=2.5.9 ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'") do
    let(:login_shell){ true }
    its(:stdout){ should start_with("OpenSSL #{openssl_version}") }
  end
end

