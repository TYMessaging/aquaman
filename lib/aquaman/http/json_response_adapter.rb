module Aquaman::HTTP
  # Adapts internal provider response to Aquaman JSON response object.
  class JsonResponseAdapter
    class << self
      def adapt(provider_response)
        JsonResponse.new(
          provider_response.status,
          provider_response.response_headers,
          parse_json(provider_response)
        )
      end

      private

      def parse_json(response)
        body = response.body
        return OpenStruct.new if body.blank?
        raise InvalidJsonResponseError, body unless valid_content_type?(response)
        JSON.parse(body, object_class: OpenStruct)
      end

      def valid_content_type?(response)
        header = response.response_headers[Aquaman::Const::Headers::CONTENT_TYPE]
        header =~ Aquaman::Const::Regex::JSON_MIME_TYPE
      end
    end
  end
end
