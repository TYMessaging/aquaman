require 'spec_helper'
require_relative '../../fakes/fake_provider_request_factory'
require_relative '../request_shared_context'

RSpec.describe Aquaman::HTTP::JSON::Request do
  include_context 'request'

  %w(get delete post put patch).each do |verb|
    describe "#{verb}" do
      subject { request.send(verb_symbol) }

      let(:verb_symbol) { verb.to_sym }

      it 'returns response' do
        expect(subject).to be_kind_of(Aquaman::HTTP::JSON::Response)
      end
    end
  end
end
