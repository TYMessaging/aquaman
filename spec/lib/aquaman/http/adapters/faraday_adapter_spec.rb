require 'spec_helper'

RSpec.describe Aquaman::HTTP::Adapters::FaradayAdapter do
  subject(:faraday_adapter) { described_class.new }

  describe '#name' do
    it { expect { faraday_adapter.name }.to raise_error(NotImplementedError) }
  end

  describe '#options' do
    it { expect(faraday_adapter.options).to eq({}) }
  end
end
