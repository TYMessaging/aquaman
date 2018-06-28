require 'spec_helper'

RSpec.describe Aquaman::Errors::HttpUnauthorizedError do
  it { expect(subject).to be_ruby_error }
end
