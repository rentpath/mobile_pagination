module MobilePagination

  class Configuration

    attr_accessor :list_item_global_class,
                  :anchor_global_class,
                  :page_key

    def initialize(data={})
      @list_item_global_class = data[:list_item_global_class] || ''
      @anchor_global_class    = data[:anchor_class] || ''
      @page_key               = data[:page_key] || :page
    end

  end
end