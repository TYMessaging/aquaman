module Aquaman::HTTP
  # Generic HTTP response.
  class Response
    include ResponseStatusChecks

    def initialize(status, headers, body)
      @status = status
      @headers = headers
      @body = body
      freeze
    end

    attr_reader :status, :headers, :body
  end
end
