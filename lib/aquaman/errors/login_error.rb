module Aquaman::Errors
  # An error which occur when login fails.
  class LoginError < StandardError
    def initialize(provider_response)
      @provider_response = provider_response
    end

    private

    attr_reader :provider_response
  end
end
