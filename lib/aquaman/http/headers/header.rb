module Aquaman::HTTP::Headers
  # Base class for a HTTP header.
  class Header
    def initialize(name, value)
      @name = name
      @value = value
      freeze
    end

    def to_h
      { name => value }
    end

    def to_s
      "#{name}: #{value}"
    end

    protected

    attr_reader :name, :value
  end
end
