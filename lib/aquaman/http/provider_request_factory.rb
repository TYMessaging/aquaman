require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

module Aquaman::HTTP
  # Creates request objects of internally used HTTP provider.
  class ProviderRequestFactory
    def initialize(adapter: Aquaman::HTTP::Adapters::Typhoeus::Adapter.new)
      @adapter = adapter
      freeze
    end

    # :reek:FeatureEnvy
    def create(url, headers, query)
      Faraday.new(url: url) do |conn|
        conn.params.merge!(query) unless query.empty?
        conn.headers.merge!(headers) unless headers.empty?
        conn.adapter adapter.name, adapter.options
      end
    end

    private

    attr_reader :adapter
  end
end
