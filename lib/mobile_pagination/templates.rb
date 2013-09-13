module MobilePagination
  module Templates

    def first_page_html
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='First Page' href='#{first_page_link}'>First Page</a>
      </li>"
    end

    def previous_page_html
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='Previous Page' href='#{previous_page_link}'>Previous Page</a>
      </li>"
    end

    def next_page_html
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='Next Page' href='#{next_page_link}'>Next Page</a>
      </li>"
    end

    def last_page_html
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='Last Page' href='#{last_page_link}'>Last Page</a>
      </li>"
    end

  end
end