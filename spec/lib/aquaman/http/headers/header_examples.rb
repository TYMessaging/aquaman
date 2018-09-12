require 'spec_helper'

RSpec.shared_examples 'header' do
  describe '#to_h' do
    subject(:hash) { header.to_h }

    it 'returns hash with one key' do
      expect(hash.keys.size).to eq(1)
    end

    it 'the key is not empty' do
      expect(hash.keys[0]).not_to be_empty
    end

    it 'contains given value' do
      expect(hash.values[0]).to include(value)
    end
  end

  describe '#to_s' do
    subject(:str) { header.to_s }

    it 'returns string which contains value' do
      expect(str).to include(value)
    end
  end
end
