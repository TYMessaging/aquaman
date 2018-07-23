require 'spec_helper'
require_relative './http_shared_context'

RSpec.describe Aquaman::HTTP::Response do
  include_context 'http'

  subject(:response) { described_class.new(status, headers, body) }

  let(:status) { 200 }
  let(:headers) { http_headers }
  let(:body) { request_body }

  describe '#status' do
    it { expect(response.status).to eq(status) }
  end

  describe '#headers' do
    it { expect(response.headers).to include(headers) }
  end

  describe '#body' do
    it { expect(response.body).to eq(body) }
  end

  describe '#successful?' do
    context 'when status is not within 400..600 range' do
      it { expect(response).to be_successful }
    end

    context 'when status is within 400..600 range' do
      let(:status) { 500 }

      it { expect(response).not_to be_successful }
    end
  end

  describe '#failed?' do
    context 'when status is within 400..600 range' do
      let(:status) { 404 }

      it { expect(response).to be_failed }
    end

    context 'when status is not within 400..600 range' do
      it { expect(response).not_to be_failed }
    end
  end
end
