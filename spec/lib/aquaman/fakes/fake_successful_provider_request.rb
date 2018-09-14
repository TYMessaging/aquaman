require_relative './fake_provider_request'

class FakeSuccessfulProviderRequest < FakeProviderRequest
  def send(verb, endpoint)
    build_response(200, {}, '{ "message": "HEY!" }')
  end
end
