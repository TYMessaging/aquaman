module Aquaman::HTTP
  class JsonClient < Client
    def initialize(
      base_url,
      provider_request_factory: ProviderRequestFactory.new,
      provider_response_adapter: JsonResponseAdapter
    )
      super(
        base_url,
        provider_request_factory: provider_request_factory,
        provider_response_adapter: provider_response_adapter
      )
    end
  end
end
