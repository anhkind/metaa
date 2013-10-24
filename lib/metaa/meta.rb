require 'action_view'

module Metaa
  class Meta
    include ActionView::Helpers::TagHelper
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def html
      tag(:meta, @attributes)
    end
  end
end