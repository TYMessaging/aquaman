class FakeProviderRequest
  def initialize(url, headers, query)
    @url = url
    @headers = headers
    @query = query
    freeze
  end

  def send(verb, endpoint)
    raise NotImplementedError
  end

  protected

  attr_reader :url,
              :headers,
              :query

  def build_response(status, headers, body)
    OpenStruct.new(
      status: status,
      headers: headers.merge({
        Aquaman::Const::Headers::CONTENT_TYPE => Aquaman::Const::MimeTypes::JSON,
      }),
      body: body
    )
  end
end
