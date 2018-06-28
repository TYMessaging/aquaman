require 'spec_helper'

RSpec::Matchers.define :be_a_response do
  match do |actual|
    actual.is_a?(Aquaman::Response)
  end
end
