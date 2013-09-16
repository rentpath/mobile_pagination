module MobilePagination
  class Paginate

    include Utils
    include Templates

    attr_reader :total_pages, :current_page, :query_params, :path

    def initialize(opts)
      @total_pages  = opts[:total_pages].to_i || 0
      @current_page = current(opts[:current_page])
      @query_params = query_to_hash(opts[:query])
      @path         = opts[:path] || '/'
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

    private

      def should_paginate?
        @total_pages > 1
      end

      def first_page?
        @current_page != 1
      end

      def previous_page?
        @current_page > 2
      end

      def next_page?
        last_page? && !second_to_last?
      end

      def last_page?
        @current_page != @total_pages
      end

      def second_to_last?
        @current_page == (@total_pages - 1)
      end

      def current(page)
        page = page.nil? ? 1 : page.to_i
        page > @total_pages ? @total_pages : page
      end

      def previous
        @current_page - 1
      end

      def page_url(page=nil)
        page.nil? ? "#{@path}#{qs_without_key}" : "#{@path}#{qs_with_key(page)}"
      end

      def qs_with_key(page)
        "?#{hash_to_query(opts_with_key(page))}"
      end

      def qs_without_key
        str = "#{hash_to_query(opts_without_key)}"
        str.insert(0, '?') unless str.empty?
      end

      def opts_with_key(page)
        @query_params.merge({ MobilePagination.configuration.page_key => page })
      end

      def opts_without_key
        @query_params.delete(MobilePagination.configuration.page_key)
        @query_params
      end

  end
end