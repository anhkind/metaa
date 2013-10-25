module Metaa
  class Definition
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def attributes_for(object)
      object_attributes = {}

      attributes.each do |attr, val|
        object_val              = val.respond_to?(:call) ? val.call(object) : val.to_s
        object_attributes[attr] = object_val
      end

      object_attributes
    end
  end
end