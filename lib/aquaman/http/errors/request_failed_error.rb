module Aquaman::HTTP::Errors
  # This error is raised when headers are not expected to be empty.
  class RequestFailedError < Aquaman::Errors::Error
    def initialize(
      response,
      status,
      headers,
      body,
      decorator_type: Aquaman::HTTP::PrintableProviderResponse
    )
      @status = status
      @headers = headers
      @body = body
      super(
        "Requested back-end responded failure:\n#{decorator_type.new(response)}"
      )
      freeze
    end

    attr_reader :status,
                :headers,
                :body
  end
end
