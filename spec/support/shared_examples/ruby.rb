RSpec.shared_examples 'ruby 3.0.0-preview2' do
  describe command("RBENV_VERSION=3.0.0-preview2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 3.0.0preview2 (2020-12-08 master d7a16670c3) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.0\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.0, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=3.0.0-preview2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

RSpec.shared_examples 'ruby 2.7.2' do
  describe command("RBENV_VERSION=2.7.2 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.7.2 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.0\n" }
  end

  describe command("RBENV_VERSION=2.7.2 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.0, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.7.2 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.7.2 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

RSpec.shared_examples 'ruby 2.6.6' do
  describe command("RBENV_VERSION=2.6.6 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.6.6 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.0\n" }
  end

  describe command("RBENV_VERSION=2.6.6 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.0, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.6.6 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.6.6 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end

RSpec.shared_examples 'ruby 2.5.8' do
  describe command("RBENV_VERSION=2.5.8 ruby -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "ruby 2.5.8p224 (2020-03-31 revision 67882) [x86_64-linux]\n" }
  end

  describe command("RBENV_VERSION=2.5.8 gem -v") do
    let(:login_shell){ true }
    its(:stdout){ should eq "3.2.0\n" }
  end

  describe command("RBENV_VERSION=2.5.8 gem list --exact bundler") do
    let(:login_shell){ true }
    its(:stdout){ should eq "bundler (default: 2.2.0, 1.17.3)\n" }
  end

  describe command("RBENV_VERSION=2.5.8 gem list") do
    let(:login_shell){ true }
    its(:stdout){ should match /^pry \(/ }
  end

  describe command("RBENV_VERSION=2.5.8 ruby -rrbconfig -e 'puts RbConfig::CONFIG[\"LIBRUBY_RELATIVE\"]'") do
    let(:login_shell){ true }
    its(:stdout){ should eq "yes\n" }
  end
end
