require 'spec_helper'

RSpec.describe Aquaman::HTTP::JsonRequestHeaders do
  subject(:headers) { described_class.new(original_headers) }

  let(:original_headers) { {} }

  describe '#to_h' do
    subject { headers.to_h }

    it 'returns hash' do
      expect(subject).to be_kind_of(Hash)
    end

    context 'when original headers are not initialized' do
      let(:original_headers) { nil }

      it 'raises argument error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when there are original headers' do
      let(:original_headers) do
        { 'some' => 'headers', 'does-not' => 'matter' }
      end

      it 'adds extra headers to original ones' do
        original_size = original_headers.keys.size
        expect(subject.keys.size).to be > original_size
      end
    end
  end
end
