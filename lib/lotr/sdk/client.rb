require 'http'
module Lotr
  module Sdk
    class Client

      def initialize(key)
        @key = key
        @base_url = 'https://the-one-api.dev/v2'
      end

      def query_api(endpoint,page=nil)
        page_param = "page=#{page}" if page
        HTTP.auth("Bearer #{@key}").get("#{@base_url}/#{endpoint}?#{page_param}")
      end

      # Movies
      def movie_list(page:1)
        Dataset.new( query_api('movie',page) )
      end

      def movie(id:)
        Dataset.new( query_api("movie/#{id}") )
      end

      # Books
      def book_list(page:1)
        Dataset.new( query_api('book',page) )
      end

      def book(id:)
        Dataset.new( query_api("book/#{id}") )
      end

      # Quotes
      def quote_list(page:1)
        Dataset.new( query_api('quote',page) )
      end

      def quote(id:)
        Dataset.new( query_api("quote/#{id}") )
      end

      # Characters
      def character_list(page:1)
        Dataset.new( query_api('character',page) )
      end

      def character(id:)
        Dataset.new( query_api("character/#{id}") )
      end


    end

  end
end
