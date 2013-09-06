# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fly/version'

Gem::Specification.new do |gem|
  gem.name          = "fly"
  gem.version       = Fly::VERSION
  gem.authors       = ["Jesse Stuart"]
  gem.email         = ["jesse@jessestuart.ca"]
  gem.description   = %q{Custom Bootstrap for Tent apps}
  gem.summary       = %q{Custom Bootstrap for Tent apps}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'sprockets', '~> 2.0'
  gem.add_runtime_dependency 'sprockets-helpers'
  gem.add_runtime_dependency 'sprockets-sass'
  gem.add_runtime_dependency 'sass'
end
