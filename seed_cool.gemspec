# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed_cool/version'

Gem::Specification.new do |gem|
  gem.name          = "seed_cool"
  gem.version       = SeedCool::VERSION
  gem.authors       = ["Daniel Gong"]
  gem.email         = ["daniel@strikingly.com"]
  gem.description   = %q{A robust and yet flexible seeding solution.}
  gem.summary       = %q{A robust and yet flexible seeding solution.}
  gem.homepage      = "https://github.com/strikingly/seed_cool"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'bundler', '~> 1.3'
  gem.add_development_dependency 'rake'
end
