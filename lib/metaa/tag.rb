module Metaa
  class Tag
    include ActionView::Helpers::TagHelper
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def to_html
      tag(:meta, @attributes)
    end
  end
end