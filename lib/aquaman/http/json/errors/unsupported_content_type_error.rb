module Aquaman::HTTP::JSON::Errors
  # This error is raised when response content type isn't JSON.
  class UnsupportedContentTypeError < Aquaman::Errors::Error
    def initialize(content_type)
      super("Unsupported content type: #{content_type}")
    end
  end
end
