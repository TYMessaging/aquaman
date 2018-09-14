module Aquaman::HTTP::Errors
  # This error is raised when headers are not expected to be empty.
  class RequestFailedError < Aquaman::Errors::Error
    def initialize(response)
      super(
        "Requested back-end responded failure:\n#{response}"
      )
    end
  end
end
