require 'aquaman/version'

# HTTP abstraction layer for building web API clients.
module Aquaman
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

  autoload :DefaultProviderRequestFactory, 'aquaman/default_provider_request_factory'
  autoload :EnvBaseUrl, 'aquaman/env_base_url'
  autoload :Login, 'aquaman/login'
  autoload :Session, 'aquaman/session'
  autoload :Client, 'aquaman/client'
  autoload :Request, 'aquaman/request'
  autoload :Response, 'aquaman/response'
end
