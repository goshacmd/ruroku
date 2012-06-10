# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ruroku/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gosha Arinich"]
  gem.email         = ["me@goshakkk.name"]
  gem.description   = %q{Ruby client for the Heroku API}
  gem.summary       = %q{Ruby client for the Heroku API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ruroku"
  gem.require_paths = ["lib"]
  gem.version       = Ruroku::VERSION

  gem.add_runtime_dependency 'heroku-api', '~> 0.2.4'
  gem.add_runtime_dependency 'activesupport', '~> 3.2.5'
  gem.add_runtime_dependency 'virtus', '~> 0.5.0'

  gem.add_development_dependency 'rspec'
end
