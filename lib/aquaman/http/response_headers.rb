module Aquaman::HTTP
  # Wrapper for HTTP response headers from provider.
  class ResponseHeaders
    def initialize(headers)
      @headers = headers
      freeze
    end

    def match?(header_name, regex)
      header = self[header_name]
      header =~ regex
    end

    def contain?(other_headers)
      (headers.to_a - other_headers.to_a).empty?
    end

    def [](header_name)
      return nil unless headers
      headers[header_name]
    end

    def to_h
      headers
    end

    protected

    attr_reader :headers
  end
end
