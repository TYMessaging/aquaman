require 'spec_helper'

RSpec::Matchers.define :raise_unauthorized_error do
  match do |subject|
    subject.is_a?(Proc) && raises_expected_error?(subject)
  end

  def supports_block_expectations?
    true
  end

  def raises_expected_error?(subject)
    begin
      subject.call
    rescue Aquaman::Errors::HttpUnauthorizedError
      return true
    end
    false
  end
end
