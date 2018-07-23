require 'spec_helper'
require_relative '../../fakes/fake_request'

RSpec.describe Aquaman::HTTP::JSON::ResponseAdapter do
  subject(:adapter) { described_class.new }

  describe '#adapt' do
    subject(:adapt) { adapter.adapt(provider_response) }

    context 'when response is valid' do
      let(:provider_response) { FakeRequest.new.get }

      it 'returns internal JSON response ob ject' do
        expect(subject).to be_kind_of(Aquaman::HTTP::JSON::Response)
      end
    end

    context 'when response has empty body' do
      let(:provider_response) do
        response = FakeRequest.new.get
        response.body = ''
        response
      end

      it 'does not raise error' do
        expect { adapt }.not_to raise_error
      end

      it 'parsed body is still initialized' do
        expect(adapt.body).not_to be_nil
      end
    end

    context 'when response body has unsupported content type' do
      let(:provider_response) do
        response = FakeRequest.new.get
        response.response_headers = {
          Aquaman::Const::Headers::CONTENT_TYPE => 'text/html',
        }
        response
      end

      it 'raises InvalidJsonResponseError' do
        expect { adapt }.to raise_error(Aquaman::HTTP::JSON::Errors::InvalidResponseError)
      end
    end
  end
end
