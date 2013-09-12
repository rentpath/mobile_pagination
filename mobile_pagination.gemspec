# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobile_pagination/version'

Gem::Specification.new do |spec|
  spec.name          = "mobile_pagination"
  spec.version       = MobilePagination::VERSION
  spec.authors       = ["Luke Fender"]
  spec.email         = ["lfender6445@gmail.com"]
  spec.description   = %q{Creates a series of list items for pagination based searches.}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"
  gem.add_dependency = "addressable", '~> 2.3.4'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
