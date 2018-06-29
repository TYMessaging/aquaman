module Aquaman::HTTP
  # Generic HTTP response.
  class Response
    def initialize(status, headers, body)
      @status = status
      @headers = headers
      @body = body
      freeze
    end

    attr_reader :status, :headers, :body

    def successful?
      !failed?
    end

    def failed?
      status.between?(400, 600)
    end
  end
end
