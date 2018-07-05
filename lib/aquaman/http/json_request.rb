module Aquaman::HTTP
  # HTTP request which expects JSON response.
  class JsonRequest < Request
    def initialize(
      base_url,
      attributes: RequestAttributes.new,
      provider_request_factory: ProviderRequestFactory.new,
      provider_response_adapter: JsonResponseAdapter
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
