module Aquaman::HTTP::JSON
  # Groupped attributes of an API request.
  class RequestAttributes < Aquaman::HTTP::RequestAttributes
    def initialize(
      endpoint:,
      headers: Defaults::HEADERS,
      query: Defaults::QUERY,
      body: Defaults::BODY
    )
      @endpoint = endpoint
      @headers = RequestHeaders.new(headers).to_h
      @query = query
      @body = body
      freeze
    end
  end
end
