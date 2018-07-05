require_relative 'shared_context'

RSpec.shared_context 'request', shared_context: :metadata do
  include_context 'shared'

  subject(:request) do
    described_class.new(
      base_url,
      endpoint: endpoint,
      headers: http_headers,
      query: query_string,
      body: request_body,
      provider_request_factory: provider_request_factory
    )
  end

  let(:base_url) { FFaker::Internet.http_url }
  let(:endpoint) { '/my/api' }
  let(:provider_request_factory) { FakeProviderRequestFactory.new }
end
