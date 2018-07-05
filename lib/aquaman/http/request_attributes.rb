module Aquaman::HTTP
  # Groupped attributes of an API request.
  class RequestAttributes
    def initialize(
      endpoint:,
      headers: {},
      query: {},
      body: Aquaman::Const::Tokens::EMPTY_STRING
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
