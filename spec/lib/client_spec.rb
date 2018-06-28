require 'spec_helper'

RSpec.describe Aquaman::Client do
  subject(:client) { described_class.new(base_url) }

  let(:base_url) { Aquaman::BaseUrl.new }

  describe '#get' do
    context 'when session is required' do
      context 'when session is provided' do
        subject { client.get(url, session) }

        it 'returns api response' do
          expect(subject).to be_kind_of(Aquaman::Response)
        end
      end

      context 'when session is not provided' do
        subject { client.get(url) }

        it 'raises unauthorized error' do
          expect { subject }.to raise_unauthorized_error
        end
      end
    end
  end

  describe '#post' do
    context 'when session is required' do
      context 'when session is provided' do
        
      end
    end
  end

  describe '#put' do
    context 'when session is required' do
      context 'when session is provided' do
        
      end
    end
  end
end