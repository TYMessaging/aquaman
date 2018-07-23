module Aquaman::HTTP::JSON::Errors
  # This error is raised when JSON could not be parsed.
  class InvalidResponseError < Aquaman::Errors::Error
    def initialize(json)
      super("Invalid JSON response: #{json}")
    end
  end
end
