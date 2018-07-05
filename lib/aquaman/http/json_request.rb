module Aquaman::HTTP
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
      # TODO: accept encoding header.
      super(
        base_url,
        endpoint: endpoint,
        headers: headers,
        query: query,
        body: body,
        provider_request_factory: provider_request_factory,
        provider_response_adapter: provider_response_adapter
      )
    end
  end
end
