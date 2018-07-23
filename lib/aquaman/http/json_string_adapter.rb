module Aquaman::HTTP
  # Converts JSON string to an object.
  class JsonStringAdapter
    DEF_OUTPUT_TYPE = OpenStruct

    def initialize(output_type: DEF_OUTPUT_TYPE)
      @output_type = output_type
      freeze
    end

    def adapt(json)
      return output_type.new if json.blank?
      JSON.parse(json, object_class: output_type)
    end

    private

    attr_reader :output_type
  end
end
