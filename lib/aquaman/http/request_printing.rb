module Aquaman::HTTP
  # Request extension which adds printing that can be used in debugging.
  module RequestPrinting
    def print
      "#{self.class}:\n#{print_verb} #{print_url}\n\n#{print_body}"
    end

    private

    def print_verb
      verb.to_s.upcase
    end

    def print_url
      "#{base_url}#{endpoint}"
    end

    def print_body
      body
    end
  end
end
