# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metaa/version'

Gem::Specification.new do |gem|
  gem.name          = "metaa"
  gem.version       = Metaa::VERSION
  gem.authors       = ["anhkind"]
  gem.email         = ["anhkind@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.add_dependency 'actionpack'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
