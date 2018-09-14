module Aquaman::HTTP
  # Adapts internal provider response to Aquaman response.
  class ProviderResponseAdapter
    class << self
      def adapt(provider_response)
        to_response(
          SuccessfulProviderResponse.new(
            provider_response
          )
        )
      end

      private

      def to_response(response)
        Response.new(
          response.status,
          response.headers,
          response.body
        )
      end
    end
  end
end
