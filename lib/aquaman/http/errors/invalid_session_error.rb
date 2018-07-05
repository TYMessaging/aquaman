module Aquaman::HTTP::Errors
  # This error is raised when session is not a valid object.
  class InvalidSessionError < Aquaman::Errors::Error
    ERROR_MESSAGE = 'Session object is not valid'.freeze

    def initialize
      super(ERROR_MESSAGE)
    end
  end
end
