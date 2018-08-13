module Aquaman::Auth
  # URL decorator which adds user name and password according
  # to Basic Auth scheme.
  class BasicAuthUrl < Aquaman::HTTP::UrlDecorator
    def initialize(orignal_url, username, password)
      @username = username
      @password = password
      super(orignal_url)
      freeze
    end

    def to_s
      parts = split_url
      split_in_two = parts.size == 2
      protocol, base_part = split_in_two ? parts : [Aquaman::Const::Url::HTTP, parts[0]]
      "#{protocol}://#{username}:#{password}@#{base_part}"
    end

    private

    attr_reader :username, :password

    def split_url
      original_url.split(/\:\/\//)
    end
  end
end
