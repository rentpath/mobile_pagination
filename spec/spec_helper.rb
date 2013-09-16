require 'rubygems'
require 'simplecov'
require 'bundler/setup'
require 'coveralls'

Coveralls.wear!

SimpleCov.start {
  add_filter '/spec/'
  add_filter '/vendor/'

}

require 'mobile_pagination'

spec_dir = File.dirname __FILE__
