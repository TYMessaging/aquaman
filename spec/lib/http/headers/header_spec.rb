require 'spec_helper'

RSpec.describe Aquaman::HTTP::Headers::Header do
  subject(:header) { described_class.new(name, value) }

  let(:name) { Aquaman::Const::Headers::ACCEPT }
  let(:value) { Aquaman::Const::MimeTypes::JSON }

  describe '#to_h' do
    subject(:hash) { header.to_h }

    it 'returns hash with given name and value' do
      expect(hash[name]).to eq(value)
    end
  end

  describe '#to_s' do
    subject(:str) { header.to_s }

    it 'returns string which contains name and value' do
      expect(str).to eq("#{name}: #{value}")
    end
  end
end
