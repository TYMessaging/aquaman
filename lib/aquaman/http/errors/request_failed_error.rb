module Aquaman::HTTP::Errors
  # This error is raised when headers are not expected to be empty.
  class RequestFailedError < Aquaman::Errors::Error
    def initialize(
      response,
      decorator_type: Aquaman::HTTP::PrintableProviderResponse
    )
      super(
        "Requested back-end responded failure:\n#{decorator_type.new(response)}"
      )
    end
  end
end
