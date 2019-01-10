require 'spec_helper'

RSpec.describe Aquaman::HTTP::Adapters::Typhoeus::Adapter do
  subject(:adapter) { described_class.new }

  describe '#name' do
    it { expect(adapter.name).to eq(:typhoeus) }
  end

  describe '#options' do
    subject(:options) { adapter.options }

    context 'when environment variables are not set' do
      it { expect(options).to eq({}) }
    end

    context 'when SSL verification is disabled via environment variable' do
      before(:example) { ENV['TYPHOEUS_DISABLE_SSL_VERIFIFACTION'] = 'yes' }

      after(:example) { ENV['TYPHOEUS_DISABLE_SSL_VERIFIFACTION'] = nil }

      it { expect(options).to eq({ ssl: { verify: false } }) }
    end
  end
end
