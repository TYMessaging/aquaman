module Aquaman::Auth
  # Session is a result of successful authentication.
  class Session
    def initialize(state, expiration_date)
      @state = state
      @expiration_date = expiration_date
      freeze
    end

    attr_reader :state

    def active?
      expiration_date > Time.now
    end

    protected

    attr_reader :expiration_date
  end
end
