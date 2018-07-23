module Aquaman::HTTP
  # The URL prefix for web API endpoints,
  # which can be taken from environment variables.
  class EnvBaseUrl
    def initialize(
      env_name: Aquaman::Const::Tokens::EMPTY_STRING,
      default: Aquaman::Const::Tokens::EMPTY_STRING
    )
      @env_name = env_name
      @default = default
      freeze
    end

    def to_s
      return default if env_name.blank?
      env_value = ENV.fetch(env_name, default)
      return default if env_value.blank?
      env_value
    end

    protected

    attr_reader :env_name, :default
  end
end
