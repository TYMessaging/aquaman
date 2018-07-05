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
    autoload :Headers, 'aquaman/const/headers'
    autoload :MimeTypes, 'aquaman/const/mime_types'
    autoload :Regex, 'aquaman/const/regex'
    autoload :Tokens, 'aquaman/const/tokens'
  end

  # Custom errors for expected issues.
  module Errors
    autoload :Error, 'aquaman/errors/error'
  end

  # HTTP primitives.
  module HTTP
    autoload :Request, 'aquaman/http/request'
    autoload :JsonRequest, 'aquaman/http/json_request'

    autoload :Response, 'aquaman/http/response'
    autoload :JsonResponse, 'aquaman/http/json_response'

    autoload :ProviderRequestFactory, 'aquaman/http/provider_request_factory'
    autoload :ProviderResponseAdapter, 'aquaman/http/provider_response_adapter'
    autoload :JsonResponseAdapter, 'aquaman/http/json_response_adapter'
    autoload :EnvBaseUrl, 'aquaman/http/env_base_url'
  end
end
