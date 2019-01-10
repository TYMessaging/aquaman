module Aquaman::HTTP::Adapters
  # Describes an adapter for Faraday.
  class FaradayAdapter
    def name
      raise NotImplementedError
    end

    # :reek:UtilityFunction
    def options
      {}.freeze
    end
  end
end
