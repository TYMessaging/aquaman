require 'spec_helper'

RSpec.describe Aquaman::HTTP::ResponseHeaders do
  subject(:headers) { described_class.new(provider_headers) }

  let(:existing_header_name) { 'X-Custom-Header' }
  let(:provider_headers) do
    {
      existing_header_name => 'Hello',
      'Cheers' => 'YEP',
    }
  end

  describe '#match?' do
    subject(:matched) { headers.match?(header_name, regex) }

    let(:header_name) { 'foo' }
    let(:regex) { /hello/i }

    context 'when header does not exist' do
      it { expect(matched).to be_falsey }
    end

    context 'when headers are nil' do
      let(:provider_headers) { nil }

      it { expect(matched).to be_falsey }
    end

    context 'when headers exists' do
      let(:header_name) { existing_header_name }

      context 'when value does not match' do
        let(:regex) { /bibibi/ }

        it { expect(matched).to be_falsey }
      end

      context 'when value matches' do
        it { expect(matched).to be_truthy }
      end
    end
  end

  describe '#[]' do
    subject(:value) { headers[header_name] }

    context 'when header exists' do
      let(:header_name) { existing_header_name }

      it 'reads header value' do
        expect(value).to eq(provider_headers[existing_header_name])
      end
    end

    context 'when header does not exist' do
      let(:header_name) { 'blah' }

      it 'returns nil' do
        expect(value).to be_nil
      end
    end
  end

  describe '#to_h' do
    subject { headers.to_h }

    it 'returns original headers' do
      expect(subject).to eq(provider_headers)
    end
  end

  describe '#contain?' do
    subject { headers.contain?(other_headers) }

    context 'when matched headers are empty' do
      let(:other_headers) { {} }

      it { expect(subject).to be_falsey }
    end

    context 'when matched headers are different' do
      let(:other_headers) { { 'x' => 'y' } }

      it { expect(subject).to be_falsey }
    end

    context 'when matched headers exist in collection' do
      let(:other_headers) { provider_headers }

      it { expect(subject).to be_truthy }
    end
  end
end
