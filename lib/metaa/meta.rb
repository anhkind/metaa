module Metaa
  class Meta
    attr_reader :object

    def initialize(object = nil)
      @object = object
    end

    def tag_collection
      @tag_collection ||= TagCollection.new
    end

    def meta(attributes = {})
      tag_collection.add(attributes)
    end

    def define_meta
      raise NotImplementedError
    end

    def to_html
      define_meta if tag_collection.empty?
      tag_collection.to_html
    end
  end
end