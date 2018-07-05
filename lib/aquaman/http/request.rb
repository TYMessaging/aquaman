module Aquaman::HTTP
  # Generic HTTP request to an API.
  class Request
    def initialize(
      base_url,
      attributes: RequestAttributes.new,
      provider_request_factory: ProviderRequestFactory.new,
      provider_response_adapter: ProviderResponseAdapter
    )
      @base_url = base_url
      @attributes = attributes
      @provider_request_factory = provider_request_factory
      @provider_response_adapter = provider_response_adapter
      freeze
    end

    def get
      send_request(:get)
    end

    def post
      send_request(:post)
    end

    def put
      send_request(:put)
    end

    def patch
      send_request(:patch)
    end

    def delete
      send_request(:delete)
    end

    protected

    attr_reader :base_url,
                :attributes,
                :provider_request_factory,
                :provider_response_adapter

    def send_request(verb)
      request = create_provider_request
      provider_response = request.send(verb, attributes.endpoint) do |req|
        body = attributes.body
        req.body = body unless body.empty?
      end
      provider_response_adapter.adapt(provider_response)
    end

    private

    DEF_BODY = Aquaman::Const::Tokens::EMPTY_STRING

    def create_provider_request
      provider_request_factory.create(
        base_url,
        attributes.headers,
        attributes.query
      )
    end
  end
end
