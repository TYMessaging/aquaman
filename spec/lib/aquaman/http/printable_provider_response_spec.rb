require 'spec_helper'
require_relative '../fakes/fake_failed_provider_request'
require_relative '../fakes/fake_successful_provider_request'
require_relative './http_shared_context'

RSpec.describe Aquaman::HTTP::PrintableProviderResponse do
  include_context 'http'

  subject(:response) { described_class.new(original_response) }

  let(:original_response) do
    request_class.
      new(base_url, http_headers, request_body).
      send(verb, endpoint)
  end

  describe '#to_s' do
    subject(:printed) { response.to_s }

    context 'when original response is successful' do
      let(:request_class) { FakeSuccessfulProviderRequest }

      it { expect(printed).to be_kind_of(String) }
      it { expect(printed).not_to be_empty }
      it { expect(printed).to include("#{original_response.status}") }
      it { expect(printed).to include(original_response.body) }

      it 'prints headers' do
        original_response.headers.each do |name, value|
          expect(printed).to include(name)
          expect(printed).to include(value)
        end
      end
    end
  end
end
