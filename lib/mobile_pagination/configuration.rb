module MobilePagination
  class Configuration

    attr_accessor :page_key

    def initialize(data={})
      @page_key = data[:page_key] || 'page'
    end

  end
end