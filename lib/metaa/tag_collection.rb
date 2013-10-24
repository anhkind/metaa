module Metaa
  class TagCollection
    attr_reader :items

    def initialize(items = [])
      @items = items
    end

    def add(item)
      if item.is_a? Hash
        item = Tag.new(item)
      end
      @items << item
    end

    def html
      @items.map(&:html).join
    end
  end
end