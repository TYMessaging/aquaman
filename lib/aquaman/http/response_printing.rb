module Aquaman::HTTP
  # Response extension which adds printing that can be used in debugging.
  module ResponsePrinting
    def print
      "#{print_status}\n#{print_headers}\n#{print_body}"
    end

    private

    def print_status
      "#{status}"
    end

    def print_headers
      return headers if headers.blank?
      headers_string = ''
      headers.each do |name, value|
        headers_string << "#{name}: #{value}\n"
      end
      headers_string
    end

    def print_body
      body
    end
  end
end
