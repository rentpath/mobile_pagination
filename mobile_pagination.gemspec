# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobile_pagination/version'

Gem::Specification.new do |spec|
  spec.name          = "mobile_pagination"
  spec.version       = MobilePagination::VERSION
  spec.authors       = ["Luke Fender"]
  spec.email         = ["lfender6445@gmail.com"]
  spec.description   = %q{Creates a series of pagination elements relative to current page, best suited for minimal screenspace.}
  spec.summary       = %q{Provides pagination elemenents for first, previous, next, and last page.}
  spec.homepage      = "https://github.com/primedia/mobile_pagination?source=c"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec'
end
