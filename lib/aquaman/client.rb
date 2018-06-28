module Aquaman
  # HTTP client which directly accesses web API.
  class Client
    def initialize(base_url)
      @base_url = base_url
    end

    def get(request)
      Response.new
    end

    def post(request)
      Response.new
    end

    def put(request)
      Response.new
    end

    def patch(request)
      Response.new
    end

    def delete(request)
      Response.new
    end

    private

    attr_reader :base_url
  end
end
