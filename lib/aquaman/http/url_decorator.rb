module Aquaman::HTTP
  # Adds aditional features to original URL.
  class UrlDecorator
    def initialize(original_url)
      @original_url = original_url
      freeze
    end

    def to_s
      original_url
    end

    protected

    attr_reader :original_url
  end
end