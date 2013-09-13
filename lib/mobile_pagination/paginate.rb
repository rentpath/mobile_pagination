module MobilePagination
  class Paginate

    include Templates
    include Utils

    def initialize(opts)
      @total_pages  = opts[:total_pages].to_i
      @current_page = current(opts[:current_page])
      @query_params = query_to_hash(opts[:query])
      @path         = opts[:path] || '/'
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

    private

    def should_paginate?
      @total_pages > 1
    end

    def previous_page
      "#{page_url(@current_page - 1)}"
    end

    def current(page)
      page = page.nil? ? 1 : page.to_i
      page > @total_pages ? @total_pages : page
    end

    def previous
      @current_page - 1
    end

    def previous_page?
      @current_page > 1
    end

    def next_page?
      not next_page_link.nil?
    end

    def first_page_link
      "#{page_url}"
    end

    def previous_page_link
      previous == 1 ? "#{first_page_link}" : "#{page_url(previous)}"
    end

    def next_page_link
      "#{page_url(@current_page + 1)}" if @current_page < @total_pages
    end

    def last_page_link
      "#{page_url(@total_pages)}"
    end

    def page_url(page=nil)
      qs = hash_to_query(opts_with_key)
      page.nil? ? "#{@path}" : "#{@path}?#{qs}"
    end

    def opts_with_key
      @query_params.merge({ MobilePagination.configuration.page_key => page })
    end

  end
end