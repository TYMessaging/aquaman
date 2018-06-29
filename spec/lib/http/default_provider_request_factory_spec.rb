require 'spec_helper'
require_relative './shared_context'

RSpec.describe Aquaman::HTTP::DefaultProviderRequestFactory do
  include_context 'shared'

  subject(:factory) { described_class.new }

  describe '#create' do
    subject { factory.create(base_url, http_headers, query_string) }

    it 'creates Faraday connection' do
      expect(subject).to be_kind_of(Faraday::Connection)
    end

    it 'sets connection url' do
      expect(subject.url_prefix.to_s).to start_with(base_url)
    end

    it 'sets request headers' do
      expect(subject.headers).to include(http_headers)
    end

    it 'sets query string' do
      expect(subject.params).to include(query_string)
    end
  end
end
