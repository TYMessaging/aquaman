require_relative '../request_shared_context'

RSpec.shared_context 'http-json', shared_context: :metadata do
  include_context 'request'

  let(:valid_provider_response) { successful_provider_response }

  let(:empty_provider_response) do
    response = valid_provider_response
    response.body = ''
    response
  end

  let(:unsupported_content_type_provider_response) do
    response = valid_provider_response
    response.headers = {
      Aquaman::Const::Headers::CONTENT_TYPE => 'text/html',
    }
    response
  end
end
