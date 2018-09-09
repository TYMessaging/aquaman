module Aquaman::Auth
  # The Authorization: Bearer header to pass authorized state.
  class AuthorizationHeader < Aquaman::HTTP::Headers::Header
    def initialize(token)
      super(
        Aquaman::Const::Headers::AUTHORIZATION,
        "Bearer #{token}"
      )
    end
  end
end
