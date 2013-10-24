require 'action_view'

require "metaa/version"
require 'metaa/tag'
require 'metaa/tag_collection'
require 'metaa/view_helper'

module Metaa
end

ActionView::Base.send :include, Metaa::ViewHelpers