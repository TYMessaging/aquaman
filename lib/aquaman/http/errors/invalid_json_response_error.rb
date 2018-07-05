module Aquaman::HTTP::Errors
  # This error is raised when JSON could not be parsed.
  class InvalidJsonResponseError < Aquaman::Errors::Error
    def initialize(json)
      super("Invalid JSON response: #{json}")
    end
  end
end
