module Aquaman::HTTP
  # Groupped attributes of an API request.
  # :reek:TooManyInstanceVariables
  class RequestAttributes
    class Defaults
      HEADERS = {}.freeze
      QUERY = {}.freeze
      BODY = Aquaman::Const::Tokens::EMPTY_STRING
    end

    def initialize(
      verb,
      endpoint,
      headers: Defaults::HEADERS,
      query: Defaults::QUERY,
      body: Defaults::BODY
    )
      @verb = verb
      @endpoint = endpoint
      @headers = headers
      @query = query
      @body = body
      freeze
    end

    attr_reader :verb,
                :endpoint,
                :headers,
                :query,
                :body
  end
end
