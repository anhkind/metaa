module Metaa
  class Meta
    attr_reader :object

    def initialize(object = nil)
      @object = object
    end

    def meta(attributes = {})
      definitions << Definition.new(attributes)
    end

    def definitions
      @definitions ||= []
    end

    # lazy define meta tags then collect
    def tag_collection
      @tag_collection ||= begin
        define_meta
        TagCollection.new(
          definitions.map do |definition|
            definition.attributes_for(object)
          end
        )
      end
    end

    def to_html
      tag_collection.to_html
    end
  end
end