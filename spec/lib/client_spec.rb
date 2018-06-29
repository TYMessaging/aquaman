require 'spec_helper'
require_relative './fakes/fake_provider_request_factory'
require_relative './shared_context'

RSpec.describe Aquaman::Client do
  include_context 'shared'

  subject(:client) do
    described_class.new(
      base_url,
      provider_request_factory: provider_request_factory
    )
  end

  let(:base_url) { FFaker::Internet.http_url }
  let(:provider_request_factory) { FakeProviderRequestFactory.new }

  describe '.new' do
    it 'can be initialized with default provider request factory' do
      described_class.new(base_url)
    end
  end

  describe 'HTTP methods' do
    let(:url) { '/my/lovely/api' }

    context 'when HTTP method does not support request body' do
      %w(get delete).each do |verb|
        describe "#{verb}" do
          subject do
            client.send(
              verb_symbol,
              url,
              headers: http_headers,
              query: query_string
            )
          end

          let(:verb_symbol) { verb.to_sym }

          it 'returns response' do
            expect(subject).to be_kind_of(Aquaman::Response)
          end
        end
      end
    end

    context 'when HTTP method supports request body' do
      %w(post put patch).each do |verb|
        describe "#{verb}" do
          subject do
            client.send(
              verb_symbol,
              url,
              headers: http_headers,
              query: query_string,
              body: request_body
            )
          end

          let(:verb_symbol) { verb.to_sym }

          it 'returns response' do
            expect(subject).to be_kind_of(Aquaman::Response)
          end
        end
      end
    end
  end
end
