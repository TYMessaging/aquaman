module Aquaman::HTTP::Errors
  # High-level request error.
  class RequestError < Aquaman::Errors::Error
    def initialize(request, inner_error)
      @inner_error = inner_error
      super(
        "The following request failed:\n#{request}\n\nError:\n#{inner_error}"
      )
    end

    attr_reader :inner_error
  end
end
