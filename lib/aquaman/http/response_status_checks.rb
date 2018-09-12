module Aquaman::HTTP
  # Handy status checks for common response statuses.
  module ResponseStatusChecks
    def successful?
      success? || redirect?
    end

    def failed?
      !successful?
    end

    def success?
      between?(200, 227)
    end

    def redirect?
      between?(300, 308)
    end

    def client_error?
      between?(400, 427)
    end

    def server_error?
      between?(500, 511)
    end

    def bad_request?
      is? 400
    end

    def unauthorized?
      is? 401
    end

    def forbidden?
      is? 403
    end

    def not_found?
      is? 404
    end

    def method_not_allowed?
      is? 405
    end

    def gone?
      is? 410
    end

    def internal_server_error?
      is? 500
    end

    def bad_gateway?
      is? 502
    end

    private

    def between?(from, to)
      status.between?(from, to)
    end

    def is?(code)
      status == code
    end
  end
end
