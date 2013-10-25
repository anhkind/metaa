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
    def tags
      @tags ||= begin
        define_meta
        collect_tags
      end
    end

    def to_html
      tags.map(&:to_html).join.html_safe
    end

    private
    def collect_tags
      TagCollection.new(
        definitions.map do |definition|
          definition.attributes_for(object)
        end
      ).tags
    end
  end
end