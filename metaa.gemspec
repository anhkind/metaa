# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metaa/version'

Gem::Specification.new do |gem|
  gem.name          = "metaa"
  gem.version       = Metaa::VERSION
  gem.authors       = ["anhkind"]
  gem.email         = ["anhkind@gmail.com"]
  gem.description   = "Metaa adds meta tags to your Rails application with ease."
  gem.summary       = "Meta tags with ease."
  gem.homepage      = "https://github.com/anhkind/metaa"

  gem.add_dependency 'activesupport',   '>= 3.0'
  gem.add_dependency 'actionpack',      '>= 3.0'

  gem.add_development_dependency 'ammeter'
  gem.add_development_dependency 'rake',          '>= 0.9.2'
  gem.add_development_dependency 'rspec',         '~> 2.12'
  gem.add_development_dependency 'rspec-mocks',   '>= 2.12.1'
  gem.add_development_dependency 'rspec-rails',   '~> 2.12'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
