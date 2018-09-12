require 'spec_helper'
require_relative './http_shared_context'

RSpec.describe Aquaman::HTTP::Response do
  include_context 'http'

  subject(:response) { described_class.new(status, headers, body) }

  let(:status) { 200 }
  let(:headers) { http_headers }
  let(:body) { request_body }

  describe '#print' do
    subject(:result) { response.print }

    it { expect(result).to be_kind_of(String) }
    it { expect(result).not_to be_empty }
    it { expect(result).to include("#{status}") }
    it { expect(result).to include(body) }

    it 'prints headers' do
      headers.each do |name, value|
        expect(result).to include(name)
        expect(result).to include(value)
      end
    end
  end
end
