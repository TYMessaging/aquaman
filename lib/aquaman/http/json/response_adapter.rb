module Aquaman::HTTP::JSON
  # Adapts internal provider response to Aquaman JSON response object.
  class ResponseAdapter
    def initialize(json_string_adapter: StringAdapter.new)
      @json_string_adapter = json_string_adapter
      freeze
    end

    def adapt(provider_response)
      to_json_response(
        AcceptableResponse.new(
          Aquaman::HTTP::SuccessfulProviderResponse.new(
            provider_response
          )
        )
      )
    end

    private

    attr_reader :json_string_adapter

    # :reek:FeatureEnvy
    def to_json_response(response)
      Response.new(
        response.status,
        response.headers,
        parse_json(response)
      )
    end

    def parse_json(response)
      json_string_adapter.adapt(response.body)
    end
  end
end
