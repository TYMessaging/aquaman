require 'spec_helper'

RSpec.shared_examples 'request-attributes' do
  describe '#verb' do
    it { expect(attr.verb).to eq(verb) }
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
