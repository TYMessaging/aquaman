require 'aquaman/version'

# Abstract layer for building web API clients.
module Aquaman
  # Authentication primitives.
  module Auth
    autoload :Login,    'aquaman/auth/login'
    autoload :Session,  'aquaman/auth/session'
  end

  # Constants used across the library.
  module Const
    autoload :Headers,    'aquaman/const/headers'
    autoload :MimeTypes,  'aquaman/const/mime_types'
    autoload :Regex,      'aquaman/const/regex'
    autoload :Tokens,     'aquaman/const/tokens'
  end

  # Custom errors for expected issues.
  module Errors
    autoload :Error, 'aquaman/errors/error'
  end

  # HTTP primitives.
  module HTTP
    autoload :Request,                  'aquaman/http/request'
    autoload :RequestAttributes,        'aquaman/http/request_attributes'
    autoload :SessionRequestAttributes, 'aquaman/http/session_request_attributes'
    autoload :Response,                 'aquaman/http/response'
    autoload :ProviderRequestFactory,   'aquaman/http/provider_request_factory'
    autoload :ProviderResponseAdapter,  'aquaman/http/provider_response_adapter'
    autoload :EnvBaseUrl,               'aquaman/http/env_base_url'

    # HTTP errors.
    module Errors
      autoload :EmptyHeadersError,    'aquaman/http/errors/empty_headers_error'
      autoload :InvalidSessionError,  'aquaman/http/errors/invalid_session_error'
    end

    # JSON parsing API.
    module JSON
      autoload :AcceptableResponse,   'aquaman/http/json/acceptable_response'
      autoload :Request,              'aquaman/http/json/request'
      autoload :RequestHeaders,       'aquaman/http/json/request_headers'
      autoload :Response,             'aquaman/http/json/response'
      autoload :ResponseAdapter,      'aquaman/http/json/response_adapter'
      autoload :StringAdapter,        'aquaman/http/json/string_adapter'

      # JSON processing errors.
      module Errors
        autoload :InvalidResponseError, 'aquaman/http/json/errors/invalid_response_error'
      end
    end
  end
end
