module Aquaman::HTTP
  # Groupped attributes of API request.
  class RequestAttributes
    def initialize(
      endpoint:,
      headers: {},
      query: {},
      body: DEF_BODY
    )
      @endpoint = endpoint
      @headers = headers
      @query = query
      @body = body
      freeze
    end

    attr_reader :endpoint, :headers, :query, :body
  end
end
