require 'spec_helper'

RSpec.describe Aquaman::HTTP::UrlDecorator do
  subject(:decorator) { described_class.new(original_url) }

  let(:original_url) { FFaker::Internet.http_url }

  describe '#to_s' do
    subject(:to_s) { decorator.to_s }

    it 'returns original url' do
      expect(to_s).to eq(original_url)
    end
  end
end
