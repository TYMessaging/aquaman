RSpec.shared_context 'session', shared_context: :metadata do
  let(:state) { FFaker::Internet.password }
  let(:expiration_date) { 7.days.from_now }
end
