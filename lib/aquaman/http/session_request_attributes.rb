module Aquaman::HTTP
  # Groupped attributes of an API request, which also include session state.
  class SessionRequestAttributes < RequestAttributes
    # :reek:LongParameterList
    def initialize(
      session,
      verb,
      endpoint,
      headers: Default::HEADERS,
      query: Default::QUERY,
      body: Default::BODY
    )
      if !(session && session.is_a?(Aquaman::Auth::Session))
        raise Errors::InvalidSessionError
      end
      @session = session
      super(
        verb,
        endpoint,
        headers: headers,
        query: query,
        body: body
      )
      freeze
    end

    protected

    attr_reader :session
  end
end
