require 'spec_helper'
require_relative '../fakes/fake_failed_provider_request'
require_relative '../fakes/fake_successful_provider_request'
require_relative './http_shared_context'

RSpec.describe Aquaman::HTTP::SuccessfulProviderResponse do
  include_context 'http'

  subject(:response) { described_class.new(original_response) }

  let(:original_response) do
    request_class.
      new(base_url, http_headers, request_body).
      send(verb, endpoint)
  end

  describe '.new' do
    context 'when original response is nil' do
      let(:original_response) { nil }

      it 'raises error' do
        expect { response }.to raise_error(
          Aquaman::HTTP::Errors::InvalidProviderResponse
        )
      end
    end

    context 'when original response does not have status' do
      let(:original_response) { double(status: nil) }

      it 'raises error' do
        expect { response }.to raise_error(
          Aquaman::HTTP::Errors::InvalidProviderResponse
        )
      end
    end

    context 'when original response failed' do
      let(:request_class) { FakeFailedProviderRequest }

      it 'raises error' do
        expect { response }.to raise_error(
          Aquaman::HTTP::Errors::RequestFailedError
        )
      end
    end

    context 'when original response is successful' do
      let(:request_class) { FakeSuccessfulProviderRequest }

      it { expect(response.status).to eq(original_response.status) }
      it { expect(response.headers).to eq(original_response.headers) }
      it { expect(response.body).to eq(original_response.body) }
    end
  end
end
