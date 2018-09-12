require 'spec_helper'

RSpec.describe Aquaman::HTTP::EnvBaseUrl do
  subject(:url) do
    described_class.new(
      env_name: base_url_env,
      default: default_url
    )
  end

  let(:base_url_env) { 'MY_API_BASE_URL' }
  let(:default_url) { FFaker::Internet.http_url }

  describe '.new' do
    it 'can be initialized with defaults' do
      expect { described_class.new }.not_to raise_error
    end
  end

  describe '#to_s' do
    subject { url.to_s }

    context 'when environment variable is not specified' do
      let(:base_url_env) { '' }

      context 'when default is not specified' do
        let(:default_url) { '' }

        it 'returns empty string' do
          expect(subject).to be_empty
        end
      end

      context 'when default is specified' do
        it 'returns default' do
          expect(subject).to eq(default_url)
        end
      end
    end

    context 'when environment variable is specified' do
      context 'when environment variable is empty' do
        before(:example) { ENV[base_url_env] = '' }

        context 'when default is not specified' do
          let(:default_url) { '' }

          it 'returns empty string' do
            expect(subject).to be_empty
          end
        end

        context 'when default is specified' do
          it 'returns default' do
            expect(subject).to eq(default_url)
          end
        end
      end

      context 'when environment variable is not empty' do
        let(:env_value) { FFaker::Internet.http_url }

        before(:example) { ENV[base_url_env] = env_value }

        it 'uses value of the variable' do
          expect(subject).to eq(env_value)
        end
      end
    end
  end
end
