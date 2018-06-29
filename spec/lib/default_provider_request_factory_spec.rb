require 'spec_helper'

RSpec.describe Aquaman::DefaultProviderRequestFactory do
  subject(:factory) { described_class.new }

  describe '#create' do
    subject { factory.create(url, headers, query) }

    let(:url) { FFaker::Internet.http_url }
    let(:headers) do
      {
        'Accept-Encoding' => 'utf8',
      }
    end
    let(:query) do
      { a: '1', b: 'qwe' }.with_indifferent_access
    end

    it 'creates Faraday connection' do
      expect(subject).to be_kind_of(Faraday::Connection)
    end

    it 'sets connection url' do
      expect(subject.url_prefix.to_s).to start_with(url)
    end

    it 'sets request headers' do
      expect(subject.headers).to include(headers)
    end

    it 'sets query string' do
      expect(subject.params).to include(query)
    end
  end
end
