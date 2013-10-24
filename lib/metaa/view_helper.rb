module Metaa
  module ViewHelpers
    def add_meta_tags(meta = [])
      meta = [meta] if !meta.is_a? Array
      self.meta_tags.concat meta
    end

    def display_meta_tags
      TagCollection.new(meta_tags).html
    end

    def meta_tags
      @meta_tags ||= []
    end
  end
end