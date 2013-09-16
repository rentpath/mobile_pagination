require 'rack/utils'

module MobilePagination
  module Utils

    def query_to_hash(qs)
      Rack::Utils.parse_nested_query(qs) || {}
    end

    def hash_to_query(hash)
      URI.encode(hash.map{|k,v| "#{k}=#{v}"}.join("&"))
    end

  end
end