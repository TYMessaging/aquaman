require 'spec_helper'

RSpec::Matchers.define :be_ruby_error do
  match do |actual|
    actual.is_a?(StandardError)
  end
end
