# coding: utf-8
require 'date'
require './lib/mobile_pagination/utils/version'

Gem::Specification.new do |gem|
 gem.name          = "mobile_pagination"
 gem.authors       = ["Luke Fender"]
 gem.email         = ["lfender6445@gmail.com"]
 gem.description   = %q{Creates a series of <li> pagination element relative to current page.}
 gem.summary       = %q{Minimal pagination templating, best suited for mobile web apps. Configure, call, and paginate!}
 gem.homepage      = 'http://github.com/lfender6445/mobile_pagination'
 gem.license       = "MIT"

 gem.add_development_dependency "rake"

 gem.required_ruby_version = '>= 1.9.3'
 gem.platform      = Gem::Platform::RUBY
 gem.date          = Date.today.to_s
 gem.files         = `git ls-files`.split("\n")
 gem.require_paths = ["lib"]
 gem.version       = MobilePagination::VERSION

end
