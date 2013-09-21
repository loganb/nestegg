# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nestegg/version'

Gem::Specification.new do |spec|
  spec.name          = "nestegg"
  spec.version       = Nestegg::VERSION
  spec.authors       = ["John D. Hume", "Logan Bowers", "Matt Scilipoti", "Josh Kline"]
  spec.email         = ["logan@datacurrent.com"]
  spec.description   = %q{Module to add a 'cause' field to exceptions and automatically chains exceptions on re-raise}
  spec.summary       = %q{Nested exceptions for ruby}
  spec.homepage      = "http://github.com/jkanywhere/nestegg"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '>= 10.1'
  spec.add_development_dependency 'rspec', '~> 2.0'

end

