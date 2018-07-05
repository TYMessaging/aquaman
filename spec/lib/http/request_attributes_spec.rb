require 'spec_helper'
require_relative 'shared_context'

RSpec.describe Aquaman::HTTP::RequestAttributes do
  include_context 'shared'

  subject(:attr) do
    described_class.new(
      endpoint: endpoint,
      headers: http_headers,
      query: query_string,
      body: request_body
    )
  end

  describe '#endpoint' do
    it { expect(attr.endpoint).to eq(endpoint) }
  end

  describe '#headers' do
    it { expect(attr.headers).to eq(http_headers) }
  end

  describe '#query' do
    it { expect(attr.query).to eq(query_string) }
  end

  describe '#body' do
    it { expect(attr.body).to eq(request_body) }
  end
end
