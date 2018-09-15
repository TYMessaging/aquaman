require 'spec_helper'
require_relative '../fakes/fake_provider_request_factory'
require_relative './request_shared_context'

RSpec.describe Aquaman::HTTP::Request do
  include_context 'request'

  describe '#send' do
    subject(:response) { request.send }

    context 'when back-end response was successful' do
      it { expect(response).to be_kind_of(Aquaman::HTTP::Response) }
    end

    context 'when back-end responded failure' do
      let(:provider_request_factory) { failed_provider_request_factory }

      it { expect { response }.to raise_error(Aquaman::HTTP::Errors::RequestFailedError) }
    end
  end

  describe '#to_s' do
    subject(:printed) { request.to_s }

    it { puts printed; expect(printed).to include(verb.to_s.upcase) }
    it { expect(printed).to include(endpoint) }
    it { expect(printed).to include(request_body) }
  end
end
