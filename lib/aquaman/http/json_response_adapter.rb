module Aquaman::HTTP
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
        if response_is_json?(response)
          JSON.parse(response.body, object_class: OpenStruct)
        else
          OpenStruct.new(raw: response.body)
        end
      end

      def response_is_json?(response)
        valid_content_type?(response) && has_body?(response)
      end

      def valid_content_type?(response)
        header = response.response_headers[Aquaman::Const::Headers::CONTENT_TYPE]
        header =~ Aquaman::Const::Regex::JSON_MIME_TYPE
      end

      def has_body?(response)
        response.body.present?
      end
    end
  end
end
