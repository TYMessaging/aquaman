require 'spec_helper'

RSpec.describe Aquaman::Errors::LoginFailedError do
  it { expect(subject).to be_ruby_error }
end
