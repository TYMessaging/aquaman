module Aquaman::HTTP::JSON
  # A decorator that adds required JSON request headers.
  class RequestHeaders
    def initialize(headers)
      raise Aquaman::HTTP::Errors::EmptyHeadersError unless headers
      @headers = headers
      @headers[Aquaman::Const::Headers::ACCEPT] = Aquaman::Const::MimeTypes::JSON
      freeze
    end

    def to_h
      @headers
    end
  end
end
