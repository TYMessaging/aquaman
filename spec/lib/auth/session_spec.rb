require 'spec_helper'
require_relative 'session_shared_context'

RSpec.describe Aquaman::Auth::Session do
  subject(:session) { described_class.new(state, expiration_date) }

  include_context 'session'

  describe '#active?' do
    context 'when session has not expired' do
      it { expect(session).to be_active }
    end

    context 'when session has expired' do
      let(:expiration_date) { -1.days.from_now }

      it { expect(session).not_to be_active }
    end
  end

  describe '#state' do
    subject { session.state }

    it 'exposes session state' do
      expect(subject).to eq(state)
    end
  end
end
