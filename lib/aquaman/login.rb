module Aquaman
  # The login process which authenticates user and creates session.
  class Login
    def initialize(username, password)
      @username = username
      @password = password
      freeze
    end

    def perform
      raise Errors::LoginError, 'TODO'
    end

    private

    attr_reader :username, :password
  end
end
