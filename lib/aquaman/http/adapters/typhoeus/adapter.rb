# frozen_string_literal: true

module Aquaman::HTTP::Adapters::Typhoeus
  # Describes Typhoeus adapter for Faraday.
  class Adapter < Aquaman::HTTP::Adapters::FaradayAdapter
    def name
      :typhoeus
    end

    def options
      super.merge(ssl_disable_verification)
    end

    private

    # :reek:UtilityFunction
    def ssl_disable_verification
      if ENV['TYPHOEUS_DISABLE_SSL_VERIFIFACTION'] == 'yes'
        return { ssl: { verify: false } }
      end
      {}
    end
  end
end
