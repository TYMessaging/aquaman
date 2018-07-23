module Aquaman::HTTP::JSON
  # Decorates provider response and rejects it if it’s not acceptable for processing.
  class AcceptableResponse
    def initialize(provider_response)
      @status = provider_response.status
      @response_headers = AcceptableResponseHeaders.new(
        provider_response.response_headers
      )
      @body = provider_response.body
      freeze
    end

    attr_reader :status, :response_headers, :body
  end
end
