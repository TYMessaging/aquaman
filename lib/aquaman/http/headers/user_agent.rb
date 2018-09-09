module Aquaman::HTTP::Headers
  # The User-Agent header
  class UserAgent < Header
    def initialize(value)
      super(
        Aquaman::Const::Headers::USER_AGENT,
        value
      )
    end
  end
end
