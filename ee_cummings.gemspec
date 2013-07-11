# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ee_cummings/version'

Gem::Specification.new do |spec|
  spec.name          = "ee_cummings"
  spec.version       = EECummings::VERSION
  spec.authors       = ["Aubrey Rhodes"]
  spec.email         = ["aubrey.c.rhodes@gmail.com"]
  spec.description   = %q{E. E. Cummings manages your ENV variables and gives you clear warnings when they are misconfigured.}
  spec.summary       = %q{A tool to validate your environment variables}
  spec.homepage      = "https://github.com/aubreyrhodes/ee_cummings"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
