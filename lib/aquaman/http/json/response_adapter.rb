module Aquaman::HTTP::JSON
  # Adapts internal provider response to Aquaman JSON response object.
  class ResponseAdapter
    def initialize(json_string_adapter: StringAdapter.new)
      @json_string_adapter = json_string_adapter
      freeze
    end

    def adapt(provider_response)
      response = AcceptableResponse.new(provider_response)
      Response.new(
        response.status,
        response.response_headers,
        parse_json(response)
      )
    end

    private

    attr_reader :json_string_adapter

    def parse_json(response)
      json_string_adapter.adapt(response.body)
    end
  end
end
