require_relative 'shared_context'

RSpec.shared_context 'client', shared_context: :metadata do
  include_context 'shared'

  subject(:client) do
    described_class.new(
      base_url,
      provider_request_factory: provider_request_factory
    )
  end

  let(:base_url) { FFaker::Internet.http_url }
  let(:provider_request_factory) { FakeProviderRequestFactory.new }
end
