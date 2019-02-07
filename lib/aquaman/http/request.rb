module Aquaman::HTTP
  # Generic HTTP request to an API.
  class Request
    include RequestPrinting

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

    def send
      request = create_provider_request
      provider_response = send_provider_request(request)
      provider_response_adapter.adapt(provider_response)
    rescue => inner_error
      raise Aquaman::HTTP::Errors::RequestError.new(self, inner_error)
    end

    def to_s
      print
    end

    protected

    attr_reader :base_url,
                :attributes,
                :provider_request_factory,
                :provider_response_adapter

    private

    def create_provider_request
      provider_request_factory.create(
        base_url,
        attributes.headers,
        attributes.query
      )
    end

    def verb
      attributes.verb
    end

    def endpoint
      attributes.endpoint
    end

    def body
      attributes.body
    end

    def has_body?
      body.present?
    end

    def send_provider_request(request)
      request.send(verb, endpoint) do |req|
        req.body = body if has_body?
      end
    end
  end
end
