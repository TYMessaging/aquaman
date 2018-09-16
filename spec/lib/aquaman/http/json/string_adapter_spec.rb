require 'spec_helper'

RSpec.describe Aquaman::HTTP::JSON::StringAdapter do
  subject(:adapter) { described_class.new }

  let(:default_output_type) { described_class::DEF_OUTPUT_TYPE }

  describe '#adapt' do
    subject(:adapt) { adapter.adapt(json) }

    context 'when JSON string is valid' do
      let(:json) { '{ "foo": "bar" }' }

      it 'does not raise any error' do
        expect { adapt }.not_to raise_error
      end

      it 'creates instance of output type' do
        expect(adapt).to be_kind_of(default_output_type)
      end

      it 'parses JSON' do
        expect(adapt['foo']).to eq('bar')
      end

      context 'when JSON string contains array' do
        let(:json) { '[{}, {}]' }

        it 'creates an array' do
          expect(adapt).to be_kind_of(Array)
        end

        it 'creates an array of output type instances' do
          expect(adapt).to all(be_kind_of(default_output_type))
        end
      end
    end
  end

  describe '#default' do
    subject(:default) { adapter.default }

    it 'returns instance of the output type' do
      expect(default).to be_kind_of(default_output_type)
    end
  end
end
