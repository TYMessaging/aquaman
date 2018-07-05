module Aquaman::HTTP
  # HTTP request which expects JSON response.
  class JsonRequest < Request
    def initialize(
      base_url,
      endpoint:,
      headers: {},
      query: {},
      body: DEF_BODY,
      provider_request_factory: ProviderRequestFactory.new,
      provider_response_adapter: JsonResponseAdapter
    )
      super(
        base_url,
        endpoint: endpoint,
        headers: JsonRequestHeaders.new(headers).to_h,
        query: query,
        body: body,
        provider_request_factory: provider_request_factory,
        provider_response_adapter: provider_response_adapter
      )
    end
  end
end
