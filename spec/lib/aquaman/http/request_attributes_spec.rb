require 'spec_helper'
require_relative './http_shared_context'
require_relative './request_attributes_examples'

RSpec.describe Aquaman::HTTP::RequestAttributes do
  include_context 'http'
  include_examples 'request-attributes'

  subject(:attr) do
    described_class.new(
      verb,
      endpoint,
      headers: http_headers,
      query: query_string,
      body: request_body
    )
  end
end
