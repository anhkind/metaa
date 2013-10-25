module Metaa
  module Concern
    extend ActiveSupport::Concern

    def meta
      @meta ||= meta_class.new(self)
    end

    def meta_tags
      meta.to_html
    end

    # (see ClassMethods#meta_class)
    def meta_class
      self.class.meta_class
    end

    module ClassMethods
      # Infers the meta class to be used by {Concern#meta} (e.g.
      # `Product` maps to `ProductMeta`).
      #
      # @return [Class] the inferred meta class.
      def meta_class
        prefix = respond_to?(:model_name) ? model_name : name
        meta_name = "#{prefix}Meta"
        meta_name.constantize
      rescue NameError => error
        raise unless error.missing_name?(meta_name)
        raise Metaa::UninferrableMetaError.new(self)
      end
    end
  end
end