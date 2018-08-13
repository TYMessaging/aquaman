module Aquaman::HTTP
  # Groupped attributes of an API request.
  class RequestAttributes
    class Defaults
      HEADERS = {}.freeze
      QUERY = {}.freeze
      BODY = Aquaman::Const::Tokens::EMPTY_STRING
    end

    def initialize(
      endpoint:,
      headers: Defaults::HEADERS,
      query: Defaults::QUERY,
      body: Defaults::BODY
    )
      @endpoint = endpoint
      @headers = headers
      @query = query
      @body = body
      freeze
    end

    attr_reader :endpoint,
                :headers,
                :query,
                :body
  end
end
