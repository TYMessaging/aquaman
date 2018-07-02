module Aquaman::HTTP
  class DefaultJsonResponseAdapter
    class << self
      def adapt(provider_response)
        Response.new(
          provider_response.status,
          provider_response.response_headers,
          parse_json(provider_response)
        )
      end

      private

      CONTENT_TYPE_HEADER = 'Content-Type'.freeze

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
        header = response.response_headers[CONTENT_TYPE_HEADER]
        header =~ Const::Regex::JSON_MIME_TYPE
      end

      def has_body?(response)
        response.body.present?
      end
    end
  end
end
