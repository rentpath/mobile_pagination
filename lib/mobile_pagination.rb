require_relative 'mobile_pagination/initialize'

module MobilePagination
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration

    attr_accessor :list_item_global_class, :anchor_global_class, :page_key

    def initialize(data={})
      @list_item_global_class = data[:list_item_global_class] || ''
      @anchor_global_class    = data[:anchor_class] || ''
      @page_key               = data[:page_key] || :page
    end
  end

  class Paginate

    def initialize(opts)
      @total_pages  = opts[:total_pages].to_i
      @current_page = current(opts[:current_page])
      @path         = opts[:path] || '/'
      @query_params = query_to_hash(opts[:query])
    end

    def query_to_hash(qs)
      Rack::Utils.parse_nested_query(qs) || {}
    end

    def hash_to_query(hash)
      URI.encode(hash.map{|k,v| "#{k}=#{v}"}.join("&"))
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


    def goto_end?
      @current_page != @total_pages
    end

    def should_paginate?
      @total_pages > 1
    end

    def previous_page
      "#{page_url(@current_page - 1)}" if @current_page > 1
    end

    def previous_page?
      @current_page > 1
    end

    def previous_page_link
      prev = @current_page - 1
      prev == 1 ? "#{page_url}" :  "#{page_url(prev)}"
    end

    def page_url(page=nil)
      opts = {
        MobilePagination.configuration.page_key => page
      }
      qs = hash_to_query(@query_params.merge(opts))
      page.nil? ? "#{@path}" : "#{@path}?#{qs}"
    end

    def current(page)
      page = page.nil? ? 1 : page.to_i
      page > @total_pages ? @total_pages : page
    end

    def next_page?
      not next_page_link.nil?
    end

    def next_page_link
      "#{page_url(@current_page + 1)}" if @current_page < @total_pages
    end

    def first_page_link
      "#{page_url}"
    end

    def last_page_link
      "#{page_url(@total_pages)}"
    end

    def first_page_html
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='First Page' href='#{first_page_link}'>Frist Page</a>
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