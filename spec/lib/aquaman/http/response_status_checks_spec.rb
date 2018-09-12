require 'spec_helper'
require_relative './http_shared_context'

RSpec.describe Aquaman::HTTP::Response do
  include_context 'http'

  subject(:response) { described_class.new(status, headers, body) }

  let(:status) { 200 }
  let(:headers) { http_headers }
  let(:body) { request_body }

  context 'when status is between 200 and 227' do
    for new_status in 200..227 do
      let(:status) { new_status }

      it { expect(response).to be_successful }
      it { expect(response).to be_success }
    end
  end

  context 'when status is between 300 and 308' do
    for new_status in 300..308 do
      let(:status) { new_status }

      it { expect(response).to be_successful }
      it { expect(response).to be_redirect }
    end
  end

  context 'when status 400 and 427' do
    for new_status in 400..427 do
      let(:status) { new_status }

      it { expect(response).to be_client_error }
      it { expect(response).to be_failed }
    end
  end

  context 'when status 500 and 511' do
    for new_status in 500..511 do
      let(:status) { new_status }

      it { expect(response).to be_server_error }
      it { expect(response).to be_failed }
    end
  end

  context 'when status is 400' do
    let(:status) { 400 }

    it { expect(response).to be_bad_request }
  end

  context 'when status is 401' do
    let(:status) { 401 }

    it { expect(response).to be_unauthorized }
  end

  context 'when status is 403' do
    let(:status) { 403 }

    it { expect(response).to be_forbidden }
  end

  context 'when status is 404' do
    let(:status) { 404 }

    it { expect(response).to be_not_found }
  end

  context 'when status is 405' do
    let(:status) { 405 }

    it { expect(response).to be_method_not_allowed }
  end

  context 'when status is 410' do
    let(:status) { 410 }

    it { expect(response).to be_gone }
  end

  context 'when status is 500' do
    let(:status) { 500 }

    it { expect(response).to be_internal_server_error }
  end

  context 'when status is 502' do
    let(:status) { 502 }

    it { expect(response).to be_bad_gateway }
  end
end
