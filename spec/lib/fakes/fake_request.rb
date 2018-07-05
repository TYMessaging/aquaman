require 'ostruct'

class FakeRequest
  def method_missing(*args)
    OpenStruct.new(
      status: 200,
      http_headers: {},
      response_headers: {
        Aquaman::Const::Headers::CONTENT_TYPE => Aquaman::Const::MimeTypes::JSON,
      },
      body: '{ "message": "Hello!" }'
    )
  end
end
