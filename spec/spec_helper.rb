require 'rubygems'
require 'simplecov'
require 'bundler/setup'
require 'rack/utils'

SimpleCov.start { add_filter '/spec/' }

require 'mobile_pagination'

spec_dir = File.dirname __FILE__