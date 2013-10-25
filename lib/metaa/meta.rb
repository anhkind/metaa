module Metaa
  class Meta
    class << self
      def meta(attributes = {})
        definitions << Definition.new(attributes)
      end

      def definitions
        @definitions ||= []
      end
    end

    attr_reader :object

    def initialize(object)
      @object = object
    end

    def tags
      @tag_collection ||= TagCollection.new(
        self.class.definitions.map do |definition|
          definition.attributes_for(object)
        end
      )

      @tag_collection.html
    end
  end
end