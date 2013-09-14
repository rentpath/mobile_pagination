require 'rubygems'
require 'simplecov'
require 'bundler/setup'
require 'rack/utils'

require 'mobile_pagination'

SimpleCov.start { add_filter '/spec/' }

spec_dir = File.dirname __FILE__