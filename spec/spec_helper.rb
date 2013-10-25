require 'bundler/setup'
require 'metaa'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with(:rspec) {|c| c.syntax = :expect}
  config.order = :random
end

class Model; include Metaa::Concern; end
class ModelMeta < Metaa::Meta; end

class OtherMeta < Metaa::Meta; end