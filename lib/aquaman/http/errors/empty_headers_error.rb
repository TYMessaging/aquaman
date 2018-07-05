module Aquaman::HTTP::Errors
  # This error is raised when headers are not expected to be empty.
  class EmptyHeadersError < Aquaman::Errors::Error
    ERROR_MESSAGE = 'Headers must not be empty'.freeze

    def initialize
      super(ERROR_MESSAGE)
    end
  end
end
