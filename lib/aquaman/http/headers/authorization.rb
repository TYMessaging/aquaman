module Aquaman::HTTP::Headers
  # The Authorization: Bearer header to pass authorized state.
  class Authorization < Header
    def initialize(token)
      super(
        Aquaman::Const::Headers::AUTHORIZATION,
        "Bearer #{token}"
      )
    end
  end
end
