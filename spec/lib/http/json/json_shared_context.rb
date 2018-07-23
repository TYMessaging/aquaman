require_relative '../../fakes/fake_request'

RSpec.shared_context 'http-json', shared_context: :metadata do
  let(:valid_provider_response) { FakeRequest.new.get }

  let(:empty_provider_response) do
    response = valid_provider_response
    response.body = ''
    response
  end

  let(:unsupported_content_type_provider_response) do
    response = valid_provider_response
    response.response_headers = {
      Aquaman::Const::Headers::CONTENT_TYPE => 'text/html',
    }
    response
  end
end
