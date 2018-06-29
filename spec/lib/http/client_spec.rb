require 'spec_helper'
require_relative '../fakes/fake_provider_request_factory'
require_relative './client_context'

RSpec.describe Aquaman::HTTP::Client do
  include_context 'client'

  describe '.new' do
    it 'can be initialized with default provider request factory' do
      described_class.new(base_url)
    end
  end

  %w(get delete post put patch).each do |verb|
    describe "#{verb}" do
      subject do
        if :get == verb_symbol || :delete == verb_symbol
          client.send(
            verb_symbol,
            url,
            headers: http_headers,
            query: query_string
          )
        else
          client.send(
            verb_symbol,
            url,
            headers: http_headers,
            query: query_string,
            body: request_body
          )
        end
      end

      let(:verb_symbol) { verb.to_sym }
      let(:url) { '/my/lovely/api' }

      it 'returns response' do
        expect(subject).to be_kind_of(Aquaman::HTTP::Response)
      end
    end
  end
end
