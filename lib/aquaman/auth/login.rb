module Aquaman::Auth
  # Base class for login process.
  # Must be implemented.
  class Login
    def initialize(credentials)
      @credentials = credentials
      freeze
    end

    def enter
      raise NotImplementedError
    end

    protected

    attr_reader :credentials
  end
end
