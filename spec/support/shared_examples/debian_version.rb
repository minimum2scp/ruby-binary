RSpec.shared_examples 'debian sid' do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('13.') }
  end
end

RSpec.shared_examples 'debian bookworm' do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('12.') }
  end
end

RSpec.shared_examples 'debian bullseye' do
  describe file('/etc/debian_version') do
    its(:content){ should match a_string_starting_with('11.') }
  end
end

