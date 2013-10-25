require 'rails/railtie'

module ActiveModel
  class Railtie < Rails::Railtie
    generators do |app|
      app ||= Rails.application # Rails 3.0.x does not yield `app`

      Rails::Generators.configure! app.config.generators
    end
  end
end

module Metaa
  class Railtie < Rails::Railtie

    config.after_initialize do |app|
      app.config.paths.add 'app/meta', eager_load: true
    end

    initializer "Metaa.setup_orm" do |app|
      [:active_record].each do |orm|
        ActiveSupport.on_load orm do
          Metaa.setup_orm self
        end
      end
    end
  end
end
