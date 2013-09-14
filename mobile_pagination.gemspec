# coding: utf-8
require 'date'
require './lib/mobile_pagination/utils/version'

Gem::Specification.new do |gem|
 gem.name          = "mobile_pagination"
 gem.authors       = ["Luke Fender"]
 gem.email         = ["lfender6445@gmail.com"]
 gem.description   = %q{Creates a series of pagination elements relative to current page.}
 gem.summary       = %q{Minimal and configurable pagination templating, best suited for smaller screenspace. Provides buttons for first, previous, next, and last page.}
 gem.homepage      = 'http://github.com/lfender6445/mobile_pagination'
 gem.license       = "MIT"

 gem.add_development_dependency "rake"
 gem.add_development_dependency 'simplecov'
 gem.add_development_dependency 'guard-rspec'
 gem.add_development_dependency 'rack-test'
 gem.add_development_dependency 'rspec'

 gem.required_ruby_version = '>= 1.9.3'
 gem.platform      = Gem::Platform::RUBY
 gem.date          = Date.today.to_s
 gem.files         = `git ls-files`.split("\n")
 gem.require_paths = ["lib"]
 gem.version       = MobilePagination::VERSION
end
