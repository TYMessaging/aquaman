require 'spec_helper'
require_relative './http_shared_context'

RSpec.describe Aquaman::HTTP::Response do
  include_context 'http'

  subject(:response) { described_class.new(status, headers, body) }

  let(:status) { 200 }
  let(:headers) { http_headers }
  let(:body) { request_body }

  describe '#print' do
    subject(:printed) { response.print }

    it { expect(printed).to be_kind_of(String) }
    it { expect(printed).not_to be_empty }
    it { expect(printed).to include("#{status}") }
    it { expect(printed).to include(body) }

    it 'prints headers' do
      headers.each do |name, value|
        expect(printed).to include(name)
        expect(printed).to include(value)
      end
    end
  end
end
