module Aquaman::HTTP::JSON
  # HTTP request which expects JSON response.
  class Request < Aquaman::HTTP::Request
    def initialize(
      base_url,
      attributes: Aquaman::HTTP::RequestAttributes.new,
      provider_request_factory: Aquaman::HTTP::ProviderRequestFactory.new,
      provider_response_adapter: ResponseAdapter.new
    )
      super(
        base_url,
        attributes: attributes,
        provider_request_factory: provider_request_factory,
        provider_response_adapter: provider_response_adapter
      )
    end
  end
end
