module Aquaman::HTTP::JSON
  # Wrapper for HTTP response headers from provider.
  class AcceptableResponseHeaders < Aquaman::HTTP::ResponseHeaders
    def initialize(headers)
      super(headers)
      check_content_type
    end

    private

    def check_content_type
      raise Errors::UnsupportedContentTypeError, content_type unless acceptable_content_type?
    end

    def acceptable_content_type?
      match?(
        Aquaman::Const::Headers::CONTENT_TYPE,
        Aquaman::Const::Regex::JSON_MIME_TYPE
      )
    end

    def content_type
      self[Aquaman::Const::Headers::CONTENT_TYPE]
    end
  end
end
