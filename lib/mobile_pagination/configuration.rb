module MobilePagination
  class Configuration

    attr_accessor :page_key

    def initialize(data={})
      @list_item_global_class = data[:li_class] || ''
      @anchor_global_class    = data[:a_class]  || ''
      @page_key               = data[:page_key] || 'page'
    end

  end
end