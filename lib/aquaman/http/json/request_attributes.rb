module Aquaman::HTTP::JSON
  # Groupped attributes of an API request.
  class RequestAttributes < Aquaman::HTTP::RequestAttributes
    def initialize(
      verb,
      endpoint,
      headers: Defaults::HEADERS,
      query: Defaults::QUERY,
      body: Defaults::BODY
    )
      super(
        verb,
        endpoint,
        headers: RequestHeaders.new(headers).to_h,
        query: query,
        body: body
      )
      freeze
    end
  end
end
