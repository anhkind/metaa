module Rspec
  class MetaGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def create_spec_file
      template 'meta_spec.rb', File.join('spec/meta', class_path, "#{singular_name}_meta_spec.rb")
    end
  end
end