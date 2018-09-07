require 'spec_helper'
require_relative './json_shared_context'

RSpec.describe Aquaman::HTTP::JSON::AcceptableResponse do
  include_context 'http-json'

  subject(:response) { described_class.new(provider_response) }

  let(:provider_response) { valid_provider_response }

  describe '.new' do
    subject(:create) { response }

    context 'when provider response is valid' do
      it 'does not raise error' do
        expect { create }.not_to raise_error
      end
    end

    context 'when provider response is empty' do
      let(:provider_response) { empty_provider_response }

      it 'does not raise error' do
        expect { create }.not_to raise_error
      end
    end

    context 'when provider response has unsupported type' do
      let(:provider_response) { unsupported_content_type_provider_response }

      it 'raises UnsupportedContentTypeError' do
        expect { create }.to raise_error(Aquaman::HTTP::JSON::Errors::UnsupportedContentTypeError)
      end
    end
  end

  describe '#status' do
    it 'is the same as provider response status' do
      expect(response.status).to eq(provider_response.status)
    end
  end

  describe '#headers' do
    it 'is the same as provider response headers' do
      expect(response.headers.contain?(provider_response.headers)).to be_truthy
    end
  end

  describe '#body' do
    it 'is the same as provider response body' do
      expect(response.body).to eq(provider_response.body)
    end
  end
end
