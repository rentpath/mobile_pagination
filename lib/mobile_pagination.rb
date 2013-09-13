require_relative 'mobile_pagination/initialize'

module MobilePagination

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

end