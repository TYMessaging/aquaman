module Aquaman::HTTP::Errors
  # This error is raised when provider response doesn't match expected contract.
  class InvalidProviderResponse < Aquaman::Errors::Error
    def initialize
      super(
        'Provider response is not valid'.freeze
      )
    end
  end
end
