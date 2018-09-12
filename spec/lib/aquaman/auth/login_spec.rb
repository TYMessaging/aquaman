require 'spec_helper'

RSpec.describe Aquaman::Auth::Login do
  subject(:login) { described_class.new(credentials) }

  let(:username) { FFaker::Internet.user_name }
  let(:password) { FFaker::Internet.password }
  let(:credentials) { { username: username, password: password } }

  describe '#enter' do
    subject { login.enter }

    it 'is not implemented in this library' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
