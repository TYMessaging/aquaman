module Aquaman
  class DefaultProviderResponseAdapter
    def self.adapt(provider_response)
      Response.new(
        provider_response.status,
        provider_response.response_headers,
        provider_response.body
      )
    end
  end
end
