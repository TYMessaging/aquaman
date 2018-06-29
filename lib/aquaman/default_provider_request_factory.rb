require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'

module Aquaman
  class DefaultProviderRequestFactory
    def initialize(adapter: :typhoeus)
      @adapter = adapter
      freeze
    end

    def create(url, headers, query)
      Faraday.new(url: url) do |conn|
        conn.params.merge!(query) unless query.empty?
        conn.headers.merge!(headers) unless headers.empty?
        conn.adapter adapter
      end
    end

    private

    attr_reader :adapter
  end
end
