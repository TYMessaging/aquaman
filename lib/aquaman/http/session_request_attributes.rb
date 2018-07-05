module Aquaman::HTTP
  # Groupped attributes of an API request, which also include session state.
  class SessionRequestAttributes < RequestAttributes
    def initialize(
      session,
      endpoint:,
      headers: {},
      query: {},
      body: DEF_BODY
    )
      if !(session && session.is_a?(Aquaman::Auth::Session))
        raise Errors::InvalidSessionError
      end
      @session = session
      super(
        endpoint: endpoint,
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
