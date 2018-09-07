module Aquaman::HTTP
  # Adapts internal provider response to Aquaman response.
  class ProviderResponseAdapter
    def self.adapt(provider_response)
      Response.new(
        provider_response.status,
        provider_response.headers,
        provider_response.body
      )
    end
  end
end
