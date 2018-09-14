require_relative './fake_successful_provider_request'

class FakeProviderRequestFactory < Aquaman::HTTP::ProviderRequestFactory
  def initialize(fake_request_type: FakeSuccessfulProviderRequest)
    @fake_request_type = fake_request_type
    freeze
  end

  def create(url, headers, query)
    fake_request_type.new(url, headers, query)
  end

  private

  attr_reader :fake_request_type
end
