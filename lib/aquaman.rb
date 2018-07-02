require 'aquaman/version'

# Abstract layer for building web API clients.
module Aquaman
  # Authentication primitives.
  module Auth
    autoload :Login, 'aquaman/auth/login'
    autoload :Session, 'aquaman/auth/session'
  end

  # Constants used across the library.
  module Const
    autoload :Tokens, 'aquaman/const/tokens'
  end

  # Custom errors for expected issues.
  module Errors
    autoload :Error, 'aquaman/errors/error'
  end

  # HTTP primitives.
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
