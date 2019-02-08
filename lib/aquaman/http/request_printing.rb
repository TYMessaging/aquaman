module Aquaman::HTTP
  # Request extension which adds printing that can be used in debugging.
  module RequestPrinting
    def print
      "#{self.class}\n#{print_verb} #{print_url}\n#{print_headers}\n#{print_body}"
    end

    private

    def print_verb
      verb.to_s.upcase
    end

    # :reek:NilCheck
    def print_url
      "#{base_url}#{endpoint}?#{attributes.query&.to_query}"
    end

    def print_body
      body
    end

    # :reek:FeatureEnvy
    # :reek:TooManyStatements
    def print_headers
      headers = attributes.headers
      return headers if headers.blank?
      headers_string = ''
      headers.each do |name, value|
        headers_string << "#{name}: #{value}\n"
      end
      headers_string
    end
  end
end
