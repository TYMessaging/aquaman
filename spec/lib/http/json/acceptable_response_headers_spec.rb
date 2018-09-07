require 'spec_helper'
require_relative './json_shared_context'

RSpec.describe Aquaman::HTTP::JSON::AcceptableResponseHeaders do
  include_context 'http-json'

  subject(:headers) { described_class.new(provider_response.headers) }

  let(:provider_response) { valid_provider_response }

  describe '.new' do
    subject(:create) { headers }

    context 'when provider headers have valid content type' do
      it 'does not raise error' do
        expect { create }.not_to raise_error
      end
    end

    context 'when provider headers have unsupported content type' do
      let(:provider_response) { unsupported_content_type_provider_response }

      it 'raises UnsupportedContentTypeError' do
        expect { create }.to raise_error(Aquaman::HTTP::JSON::Errors::UnsupportedContentTypeError)
      end
    end
  end
end
