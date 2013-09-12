# require "mobile_pagination/version"
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
    attr_accessor :list_item_class

    def initialize(data={})
      @list_item_class = data[:list_item_class]
    end
  end

  class Paginate
    # MobilePagination::Paginate.new(params).html
    # raise error if no params
    def iniitialize(options = {})
      @total_pages  = options[:total_pages]
      @current_page = options[:page]
    end

    def page_url(page_number)
      query_params = request.query_parameters.merge(:page => page_number)
      uri = Addressable::URI.new
      uri.query_values = query_params
      request.path + '/?' + uri.query
    end

    # def check_opts
    #   @total_pages.to_i if @total_pages.is_a? String
    # end

    # def heading
    #   "Page #{current_page} of #{total_pages}"
    # end

    # def links
    #   build_links
    # end

    # def previous_page
    #   "#{page_url(current_page - 1)}" if current_page > 1
    # end

    # def previous_page?
    #   !previous_page.nil?
    # end

    # def next_page
    #  "#{page_url(current_page + 1)}" if current_page < total_pages
    # end

    # def next_page?
    #   !next_page.nil?
    # end

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

    # def current_page
    #   current_page = @results['current_page']
    #   current_page > total_pages ? total_pages : current_page
    # end

    # def total_pages
    #   @results['total_pages']
    # end

    # def first_page_in_group
    #   mod_val = (current_page - 1) % group_size
    #   first_page = mod_val == 0 ? current_page : current_page - mod_val
    # end

    # def last_page_in_group
    #   mod_val = (current_page - 1) % group_size
    #   last_page = [first_page_in_group+group_size, total_pages].min
    # end

    # def first_page_link
    #   "#{page_url(1)}"
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

    def html
    end

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
