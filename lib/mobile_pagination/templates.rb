module MobilePagination
  module Templates

    def first_page_html
      generate_pagination_link title: 'First Page',
                               href: first_page_link,
                               text: 'First Page'
    end

    def previous_page_html
      generate_pagination_link title: 'Previous Page',
                               href: previous_page_link,
                               text: 'Previous Page'
    end

    def next_page_html
      generate_pagination_link title: 'Next Page',
                               href: next_page_link,
                               text: 'Next Page'
    end

    def last_page_html
      generate_pagination_link title: 'Last Page',
                               href: last_page_link,
                               text: 'Last Page'
    end

    def html
      return '' unless should_paginate?
      ''.tap do |markup|
        markup << first_page_html    if first_page?
        markup << previous_page_html if previous_page?
        markup << next_page_html     if next_page?
        markup << last_page_html     if last_page?
      end
    end

    def generate_pagination_link(opts)
      "<li>
        <a title='#{opts[:title]}' href='#{opts[:href]}'>#{opts[:text]}</a>
      </li>"
    end

  end
end
