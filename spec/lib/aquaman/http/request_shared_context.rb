require_relative './http_shared_context'
require_relative '../fakes/fake_failed_provider_request'
require_relative '../fakes/fake_provider_request_factory'

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
      :get,
      endpoint,
      headers: http_headers,
      query: query_string,
      body: request_body
    )
  end

  let(:provider_request_factory) { FakeProviderRequestFactory.new }

  let(:failed_provider_request_factory) do
    FakeProviderRequestFactory.new(fake_request_type: FakeFailedProviderRequest)
  end

  let(:successful_provider_response) do
    provider_request_factory.create(
      base_url,
      http_headers,
      request_body
    ).send(verb, endpoint)
  end

  let(:failed_provider_response) do
    failed_provider_request_factory.create(
      base_url,
      http_headers,
      request_body
    ).send(verb, endpoint)
  end
end
