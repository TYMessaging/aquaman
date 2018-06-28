module Aquaman
  # Session is a result of successful authentication.
  class Session
    def initialize(token, expiration_date)
      @token = token
      @expiration_date = expiration_date
      freeze
    end

    def active?
      expiration_date > Time.now
    end

    private

    attr_reader :expiration_date, :token
  end
end
