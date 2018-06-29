require 'spec_helper'
require_relative './fakes/fake_request'

RSpec.describe Aquaman::DefaultProviderResponseAdapter do
  subject(:adapter) { described_class }

  let(:provider_response) { FakeRequest.new.get }

  describe '.adapt' do
    subject { adapter.adapt(provider_response) }

    it 'returns internal response object' do
      expect(subject).to be_kind_of(Aquaman::Response)
    end
  end
end
