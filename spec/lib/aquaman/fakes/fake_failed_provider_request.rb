require_relative './fake_provider_request'

class FakeFailedProviderRequest < FakeProviderRequest
  def send(verb, endpoint)
    build_response(405, {}, '{ "error": "Method not allowed!" }')
  end
end
