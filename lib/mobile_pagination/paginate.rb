module MobilePagination
  class Paginate

    include Templates
    include Utils

    def initialize(opts)
      @total_pages  = opts[:total_pages].to_i
      @current_page = current(opts[:current_page])
      @path         = opts[:path] || '/'
      @query_params = query_to_hash(opts[:query])
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

    def should_paginate?
      @total_pages > 1
    end

    def previous_page
      "#{page_url(@current_page - 1)}"
    end

    def page_url(page=nil)
      opts = { MobilePagination.configuration.page_key => page }
      qs = hash_to_query(@query_params.merge(opts))
      page.nil? ? "#{@path}" : "#{@path}?#{qs}"
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
      previous == 1 ? "#{page_url}" : "#{page_url(previous)}"
    end

    def next_page_link
      "#{page_url(@current_page + 1)}" if @current_page < @total_pages
    end

    def last_page_link
      "#{page_url(@total_pages)}"
    end

  end
end