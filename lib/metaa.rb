require 'action_view'

require "metaa/version"
require 'metaa/tag'
require 'metaa/tag_collection'
require 'metaa/view_helper'
require 'metaa/definition'
require 'metaa/meta'
require 'metaa/concern'
require 'metaa/railtie' if defined?(Rails)

module Metaa
  def self.setup_orm(base)
    base.class_eval do
      include Metaa::Concern
    end
  end

  class UninferrableMetaError < NameError
    def initialize(klass)
      super("Could not infer a meta for #{klass}.")
    end
  end
end

ActionView::Base.send :include, Metaa::ViewHelpers