module MobilePagination
  module Templates

    def first_page_html
      "<li class='btns'>
        <a title='First Page' href='#{first_page_link}'>First Page</a> |
      </li>"
    end

    def previous_page_html
      "<li'>
        <a title='Previous Page' href='#{previous_page_link}'>Previous Page</a> |
      </li>"
    end

    def next_page_html
      "<li>
        <a title='Next Page' href='#{next_page_link}'>Next Page</a> |
      </li>"
    end

    def last_page_html
      "<li>
        <a title='Last Page' href='#{last_page_link}'>Last Page</a>
      </li>"
    end

    def html
      return '' unless should_paginate?
      ''.tap do |markup|
        markup << first_page_html    if previous_page?
        markup << previous_page_html if previous_page?
        markup << next_page_html     if next_page?
        markup << last_page_html     if next_page?
      end
    end

  end
end