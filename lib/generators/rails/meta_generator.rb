require "rails/generators"

module Rails
  module Generators
    class MetaGenerator < NamedBase
      source_root File.expand_path("../templates", __FILE__)
      check_class_collision suffix: "Meta"

      class_option :parent, type: :string, desc: "The parent class for the generated meta"

      def create_meta_file
        template 'meta.rb', File.join('app/meta', class_path, "#{file_name}_meta.rb")
      end

      hook_for :test_framework

      private
      def parent_class_name
        options.fetch("parent") do
          begin
            require 'application_meta'
            ApplicationMeta
          rescue LoadError
            "Metaa::Meta"
          end
        end
      end

      def object_name
        class_name.to_s.underscore
      end

      # Rails 3.0.X compatibility, stolen from https://github.com/jnunemaker/mongomapper/pull/385/files#L1R32
      unless methods.include?(:module_namespacing)
        def module_namespacing
          yield if block_given?
        end
      end
    end
  end
end