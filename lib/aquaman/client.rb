module Aquaman
  # Generic HTTP client
  class Client
    def initialize(
      base_url,
      provider_request_factory: DefaultProviderRequestFactory.new,
      provider_response_adapter: DefaultProviderResponseAdapter
    )
      @base_url = base_url
      @provider_request_factory = provider_request_factory
      @provider_response_adapter = provider_response_adapter
      freeze
    end

    def get(url, headers: {}, query: {})
      send_request(:get, url, headers, query)
    end

    def post(url, headers: {}, query: {}, body: Const::Tokens::EMPTY_STRING)
      send_request(:post, url, headers, query, body: body)
    end

    def put(url, headers: {}, query: {}, body: Const::Tokens::EMPTY_STRING)
      send_request(:put, url, headers, query, body: body)
    end

    def patch(url, headers: {}, query: {}, body: Const::Tokens::EMPTY_STRING)
      send_request(:patch, url, headers, query, body: body)
    end

    def delete(url, headers: {}, query: {})
      send_request(:delete, url, headers, query)
    end

    protected

    attr_reader :base_url,
                :provider_request_factory,
                :provider_response_adapter

    def send_request(
      verb,
      url,
      headers,
      query,
      body: Const::Tokens::EMPTY_STRING
    )
      request = create_provider_request(base_url, headers, query)
      provider_response = request.send(verb, url) do |req| 
        req.body = body unless body.empty?
      end
      provider_response_adapter.adapt(provider_response)
    end

    def create_provider_request(base_url, headers, query)
      provider_request_factory.create(base_url, headers, query)
    end
  end
end
