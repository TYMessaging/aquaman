require 'spec_helper'

RSpec.describe Aquaman::Login do
  subject(:login) { described_class.new(username, password) }

  let(:username) { FFaker::Internet.user_name }
  let(:password) { FFaker::Internet.password }

  describe '#perform' do
    subject { login.perform }

    context 'when credentials are correct' do
      it 'returns session object' do
        expect(subject).to be_kind_of(Aquaman::Session)
      end

      it 'returns active session' do
        expect(subject).to be_active
      end
    end

    context 'when credentials are not correct' do
      let(:username) { 'not' }
      let(:password) { 'correct' }

      it 'raises error' do
        expect { subject }.to raise_error
      end
    end
  end
end
