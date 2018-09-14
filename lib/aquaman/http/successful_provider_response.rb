module Aquaman::HTTP
  # The decorator for provider response (Faraday) which makes sure
  # that the response is successful.
  class SuccessfulProviderResponse
    include ResponseStatusChecks

    def initialize(original_response)
      @response = original_response
      freeze
      validate
    end

    def status
      response.status
    end

    def headers
      response.headers
    end

    def body
      response.body
    end

    private

    attr_reader :response

    def validate
      validate_response
      validate_status
    end

    def validate_response
      if !response || !response.status
        raise Aquaman::HTTP::Errors::InvalidProviderResponse
      end
    end

    def validate_status
      if failed?
        raise Aquaman::HTTP::Errors::RequestFailedError.new(response)
      end
    end
  end
end
