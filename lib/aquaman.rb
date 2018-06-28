require 'aquaman/version'

# HTTP abstraction layer for building web API clients.
module Aquaman
  # Custom errors for expected issues.
  module Errors
    autoload :Error, 'aquaman/errors/error'
    autoload :HttpUnauthorizedError, 'aquaman/errors/http_unauthorized_error'
    autoload :LoginFailedError, 'aquaman/errors/login_failed_error'
  end

  autoload :Login, 'aquaman/login'
  autoload :Session, 'aquaman/session'
  autoload :BaseUrl, 'aquaman/base_url'
  autoload :Client, 'aquaman/client'
  autoload :Request, 'aquaman/request'
  autoload :Response, 'aquaman/response'
end
