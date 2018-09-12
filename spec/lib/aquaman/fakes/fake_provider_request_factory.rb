require_relative 'fake_request'

class FakeProviderRequestFactory
  def create(url, headers, query)
    FakeRequest.new
  end
end
