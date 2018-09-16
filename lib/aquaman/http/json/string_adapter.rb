module Aquaman::HTTP::JSON
  # Converts JSON string to an object.
  class StringAdapter
    DEF_OUTPUT_TYPE = Hash

    def initialize(output_type: DEF_OUTPUT_TYPE)
      @output_type = output_type
      freeze
    end

    def adapt(json)
      return default if json.blank?
      ::JSON.parse(json, object_class: output_type)
    end

    def default
      output_type.new
    end

    private

    attr_reader :output_type
  end
end
