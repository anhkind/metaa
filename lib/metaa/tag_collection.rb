module Metaa
  class TagCollection
    def initialize(tags = [])
      add(tags)
    end

    def tags
      @tags ||= []
    end

    def empty?
      tags.empty?
    end

    def add(new_tags)
      new_tags = [new_tags] if !new_tags.is_a? Array
      new_tags.each do |tag|
        tag = Tag.new(tag) if !tag.is_a?(Tag)
        tags << tag
      end
    end

    def to_html
      tags.map(&:to_html).join.html_safe
    end
  end
end