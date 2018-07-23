module Aquaman::HTTP::JSON
  # Adapts internal provider response to Aquaman JSON response object.
  class ResponseAdapter
    def initialize(json_string_adapter: StringAdapter.new)
      @json_string_adapter = json_string_adapter
      freeze
    end

    def adapt(provider_response)
      Response.new(
        provider_response.status,
        provider_response.response_headers,
        parse_json(provider_response)
      )
    end

    private

    attr_reader :json_string_adapter

    def parse_json(response)
      body = response.body
      return json_string_adapter.default if body.blank?
      raise Errors::InvalidResponseError, body unless valid_content_type?(response)
      json_string_adapter.adapt(body)
    end

    def valid_content_type?(response)
      header = response.response_headers[Aquaman::Const::Headers::CONTENT_TYPE]
      header =~ Aquaman::Const::Regex::JSON_MIME_TYPE
    end
  end
end
