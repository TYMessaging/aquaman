require 'spec_helper'
require_relative '../fakes/fake_provider_request_factory'
require_relative './request_shared_context'

RSpec.describe Aquaman::HTTP::Request do
  include_context 'request'

  describe '#send' do
    describe 'response' do
      subject(:response) { request.send }

      it { expect(response).to be_kind_of(Aquaman::HTTP::Response) }
    end
  end
end
