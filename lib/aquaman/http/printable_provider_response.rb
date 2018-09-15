module Aquaman::HTTP
  # The decorator for provider response (Faraday) which adds
  # nice printing to simplify debugging.
  class PrintableProviderResponse
    include ResponsePrinting

    def initialize(response)
      @status = response.status
      @headers = response.headers
      @body = response.body
      freeze
    end

    attr_reader :status,
                :headers,
                :body

    def to_s
      print
    end
  end
end
