module Aquaman
  # HTTP client which directly accesses web API.
  class Client
    def initialize(
      base_url,
      provider_request_factory: DefaultProviderRequestFactory.new
    )
      @base_url = base_url
      @provider_request_factory = provider_request_factory
      freeze
    end

    def get(url, headers: {}, query: {})
      send_request(:get, url, headers, query)
    end

    def post(url, headers: {}, query: {}, body: Const::Tokens::EMPTY_STRING)
      send_request(:post, url, headers, query, body)
    end

    def put(url, headers: {}, query: {}, body: Const::Tokens::EMPTY_STRING)
      send_request(:put, url, headers, query, body)
    end

    def patch(url, headers: {}, query: {}, body: Const::Tokens::EMPTY_STRING)
      send_request(:patch, url, headers, query, body)
    end

    def delete(url, headers: {}, query: {})
      send_request(:delete, url, headers, query)
    end

    private

    attr_reader :base_url, :provider_request_factory

    def send_request(
      verb,
      url,
      headers,
      query,
      body: Const::Tokens::EMPTY_STRING
    )
      provider_request_factory.
        create(base_url, headers, query, body).
        send(verb, url) { |req| req.body = body unless body.empty? }
    end
  end
end
