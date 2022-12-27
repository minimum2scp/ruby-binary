RSpec.shared_context 'rust >= 1.58' do
  let(:have_rust_1_58_or_later){ true }
end

RSpec.shared_context 'no rust' do
  let(:have_rust_1_58_or_later){ false }
end

