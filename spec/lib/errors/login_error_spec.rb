require 'spec_helper'

RSpec.describe Aquaman::Errors::LoginError do
  subject(:error) { described_class.new(provider_response) }

  let(:provider_response) { 'Wrong credentials!' }

  it { expect(error).to be_ruby_error }
end
