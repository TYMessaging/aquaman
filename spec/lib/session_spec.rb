require 'spec_helper'

RSpec.describe Aquaman::Session do
  subject(:session) { described_class.new(token, expiration_date) }

  let(:token) { FFaker::Internet.password }
  let(:expiration_date) { 7.days.from_now }

  describe '#active?' do
    context 'when session has not expired' do
      it { expect(session).to be_active }
    end

    context 'when session has expired' do
      let(:expiration_date) { -1.days.from_now }

      it { expect(session).not_to be_active }
    end
  end
end
