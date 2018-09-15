require 'aquaman/version'

# Abstract layer for building web API clients.
module Aquaman
  # Authentication primitives.
  module Auth
    autoload :BasicAuthUrl,        'aquaman/auth/basic_auth_url'
    autoload :Login,               'aquaman/auth/login'
    autoload :Session,             'aquaman/auth/session'
  end

  # Constants used across the library.
  module Const
    autoload :Headers,    'aquaman/const/headers'
    autoload :MimeTypes,  'aquaman/const/mime_types'
    autoload :Regex,      'aquaman/const/regex'
    autoload :Tokens,     'aquaman/const/tokens'
    autoload :Url,        'aquaman/const/url'
  end

  # Custom errors for expected issues.
  module Errors
    autoload :Error, 'aquaman/errors/error'
  end

  # HTTP primitives.
  module HTTP
    autoload :RequestAttributes,          'aquaman/http/request_attributes'
    autoload :Request,                    'aquaman/http/request'
    autoload :ResponseHeaders,            'aquaman/http/response_headers'
    autoload :ResponsePrinting,           'aquaman/http/response_printing'
    autoload :RequestPrinting,            'aquaman/http/request_printing'
    autoload :ResponseStatusChecks,       'aquaman/http/response_status_checks'
    autoload :Response,                   'aquaman/http/response'
    autoload :ProviderRequestFactory,     'aquaman/http/provider_request_factory'
    autoload :ProviderResponseAdapter,    'aquaman/http/provider_response_adapter'
    autoload :EnvBaseUrl,                 'aquaman/http/env_base_url'
    autoload :PrintableProviderResponse,  'aquaman/http/printable_provider_response'
    autoload :SuccessfulProviderResponse, 'aquaman/http/successful_provider_response'
    autoload :UrlDecorator,               'aquaman/http/url_decorator'

    # HTTP errors.
    module Errors
      autoload :EmptyHeadersError,       'aquaman/http/errors/empty_headers_error'
      autoload :InvalidSessionError,     'aquaman/http/errors/invalid_session_error'
      autoload :InvalidProviderResponse, 'aquaman/http/errors/invalid_provider_response'
      autoload :RequestFailedError,      'aquaman/http/errors/request_failed_error'
    end

    # HTTP headers.
    module Headers
      autoload :Authorization, 'aquaman/http/headers/authorization'
      autoload :Header,        'aquaman/http/headers/header'
      autoload :UserAgent,     'aquaman/http/headers/user_agent'
    end

    # JSON parsing API.
    module JSON
      autoload :AcceptableResponse,         'aquaman/http/json/acceptable_response'
      autoload :AcceptableResponseHeaders,  'aquaman/http/json/acceptable_response_headers'
      autoload :Request,                    'aquaman/http/json/request'
      autoload :RequestHeaders,             'aquaman/http/json/request_headers'
      autoload :Response,                   'aquaman/http/json/response'
      autoload :ResponseAdapter,            'aquaman/http/json/response_adapter'
      autoload :StringAdapter,              'aquaman/http/json/string_adapter'

      # JSON processing errors.
      module Errors
        autoload :UnsupportedContentTypeError, 'aquaman/http/json/errors/unsupported_content_type_error'
      end
    end
  end
end
