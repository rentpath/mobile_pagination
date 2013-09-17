require 'mobile_pagination/version'
require 'mobile_pagination/utils'
require 'mobile_pagination/configuration'
require 'mobile_pagination/templates'
require 'mobile_pagination/paginate'

module MobilePagination
  class << self
    attr_accessor :configuration
  end

  def self.configure
    @configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

end

MobilePagination.configure unless block_given?
