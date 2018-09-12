require 'spec_helper'

RSpec.describe Aquaman::Errors::Error do
  it { expect(subject).to be_ruby_error }
end
