require 'aquaman/version'

# Abstraction layer for building API clients.
module Aquaman
  module Auth
    autoload :Login, 'aquaman/login'
    autoload :Session, 'aquaman/session'
  end

  # Constants used in the library.
  module Const
    autoload :Tokens, 'aquaman/const/tokens'
  end

  # Custom errors for expected issues.
  module Errors
    autoload :Error, 'aquaman/errors/error'
    autoload :HttpUnauthorizedError, 'aquaman/errors/http_unauthorized_error'
    autoload :LoginFailedError, 'aquaman/errors/login_failed_error'
  end

  module HTTP
    autoload :Client, 'aquaman/http/client'
    autoload :JsonClient, 'aquaman/http/json_client'
    autoload :DefaultProviderRequestFactory, 'aquaman/http/default_provider_request_factory'
    autoload :DefaultProviderResponseAdapter, 'aquaman/http/default_provider_response_adapter'
    autoload :EnvBaseUrl, 'aquaman/http/env_base_url'
    autoload :Request, 'aquaman/http/request'
    autoload :Response, 'aquaman/http/response'
  end
end
