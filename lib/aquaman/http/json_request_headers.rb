module Aquaman::HTTP
  # A decorator that adds requered JSON request headers.
  class JsonRequestHeaders
    def initialize(headers)
      @headers = headers || {}
      @headers[Aquaman::Const::Headers::ACCEPT] = Aquaman::Const::MimeTypes::JSON
      freeze
    end

    def to_h
      @headers
    end
  end
end
