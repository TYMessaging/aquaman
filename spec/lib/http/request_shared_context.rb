require_relative './http_shared_context'

RSpec.shared_context 'request', shared_context: :metadata do
  include_context 'http'

  subject(:request) do
    described_class.new(
      base_url,
      attributes: attributes,
      provider_request_factory: provider_request_factory
    )
  end

  let(:attributes) do
    Aquaman::HTTP::RequestAttributes.new(
      endpoint: endpoint,
      headers: http_headers,
      query: query_string,
      body: request_body
    )
  end

  let(:provider_request_factory) { FakeProviderRequestFactory.new }
end
