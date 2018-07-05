require 'spec_helper'
require_relative 'shared_context'
require_relative '../auth/session_shared_context'

RSpec.describe Aquaman::HTTP::SessionRequestAttributes do
  include_context 'shared'
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
