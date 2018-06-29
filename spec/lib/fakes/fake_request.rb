require 'ostruct'

class FakeRequest
  def method_missing(*args)
    OpenStruct.new(
      status: 200,
      http_headers: {},
      body: 'Hello'
    )
  end
end
