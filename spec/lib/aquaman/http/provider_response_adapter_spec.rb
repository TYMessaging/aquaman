require 'spec_helper'
require_relative './request_shared_context'

RSpec.describe Aquaman::HTTP::ProviderResponseAdapter do
  include_context 'request'

  subject(:adapter) { described_class }

  let(:provider_response) { successful_provider_response }

  describe '.adapt' do
    subject { adapter.adapt(provider_response) }

    it 'returns internal response object' do
      expect(subject).to be_kind_of(Aquaman::HTTP::Response)
    end
  end
end
