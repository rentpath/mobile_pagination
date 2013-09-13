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
      ''.tap do |markup|
        markup << first_link  if previous_page?
        if next_page?
          markup << second_link
        end
      end
    end

    def first_link
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='Previous Page' href='#{previous_page_link}'>Previous Page</a>
      </li>"
    end

    def second_link
      "<li class='#{MobilePagination.configuration.list_item_global_class}'>
        <a class='#{MobilePagination.configuration.anchor_global_class}' title='Next Page' href='#{next_page_link}'>Next Page</a>
      </li>"
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

    # def check_opts
    #   @total_pages.to_i if @total_pages.is_a? String
    # end

    # end

    # def links
    #   build_links
    # end

    def next_page?
      not next_page_link.nil?
    end

    def next_page_link
      if @current_page < @total_pages
        "#{page_url(@current_page + 1)}"
      end
    end


    # def previous_group
    #   @previous_group ||= "#{page_url(first_page_in_group - group_size)}" if current_page > group_size
    # end

    # def previous_group?
    #   !previous_group.nil?
    # end

    # def next_group
    #   @next_group ||= "#{page_url(first_page_in_group + group_size)}" if (first_page_in_group + group_size) < total_pages
    # end

    # def next_group?
    #   !next_group.nil?
    # end

    # def group_size
    #   3
    # end

    # private





    # def first_page_in_group
    #   mod_val = (current_page - 1) % group_size
    #   first_page = mod_val == 0 ? current_page : current_page - mod_val
    # end

    # def last_page_in_group
    #   mod_val = (current_page - 1) % group_size
    #   last_page = [first_page_in_group+group_size, total_pages].min
    # end



    # def last_page_link
    #   "#{page_url(total_pages)}"
    # end

    # def build_links
    #   array = []
    #   if total_pages > 1

    #     (first_page_in_group..last_page_in_group).each do |index|
    #       array << page_link(index)
    #     end
    #   end
    #   array[0...group_size]
    # end

    # def page_link(page_number)
    #   if current_page != page_number
    #     "<a class='tag_link_page pagination_link' href='#{page_url(page_number)}'>#{page_number}</a>"
    #   else
    #     page_number.to_s
    #   end
    # end

  end

end

# module MobilePagination

#   class Paginate

#     attr_accessor :total_pages



#   end
# end
# # ul.pagination-links
# #       - if previous_page?
# #         li.btns
# #           a.tag_link_first.pagination_first_link.sprite title="First Page" href="#{first_page_link}"

# #         li.btns
# #           a.tag_link_prev.pagination_previous_link.sprite title="Previous Page" href="#{previous_page}"

# #       li
# #         .current #{heading}

# #       - if next_page?
# #         li.btns
# #           a.tag_link_next.pagination_next_link.sprite title="Next Page" href="#{next_page}" class="next_page_link"

# #         li.btns
# #           a.tag_link_last.pagination_last_link.sprite title="Last Page" href="#{last_page_link}" class="next_page_link"
