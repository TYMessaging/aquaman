require 'spec_helper'
require_relative './http_shared_context'
require_relative '../auth/session_shared_context'
require_relative './request_attributes_examples'

RSpec.describe Aquaman::HTTP::SessionRequestAttributes do
  include_context 'http'
  include_context 'session'
  include_examples 'request-attributes'

  subject(:attr) do
    described_class.new(
      Aquaman::Auth::Session.new(state, expiration_date),
      endpoint: endpoint,
      headers: http_headers,
      query: query_string,
      body: request_body
    )
  end
end
