require 'spec_helper'

RSpec.describe Aquaman::Auth::BasicAuthUrl do
  subject(:url) { described_class.new(original_url, username, password) }

  let(:original_url) { FFaker::Internet.http_url }
  let(:username) { FFaker::Internet.user_name }
  let(:password) { FFaker::Internet.password }

  describe '#to_s' do
    subject(:result) { url.to_s }

    describe 'result' do
      it 'does not equal to original url' do
        expect(result).not_to eq(original_url)
      end

      it 'contains user name' do
        expect(result).to include(username)
      end

      it 'contains password' do
        expect(result).to include(password)
      end

      it 'matches base auth url scheme' do
        expect(result).to match(/https?\:\/\/#{username}\:#{password}@.+/)
      end

      context 'when original url does not contain protocol' do
        let(:original_url) { FFaker::Internet.domain_name }

        it 'adds HTTP protocol' do
          expect(result).to start_with(Aquaman::Const::Url::HTTP)
        end

        it 'ends with original URL' do
          expect(result).to end_with(original_url)
        end
      end
    end
  end
end
