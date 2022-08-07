
module Lotr
  module Sdk
    class Dataset
      attr_accessor :data, :meta, :error
      def initialize(response)
        if response.code < 300
          list = response.parse
          @data = list['docs']
          @meta = {
            total_count: list['total'],
            current_page: list['page'],
            total_pages: list['pages']
          }
        else
          @error = {
            error_code: response.code,
            error_message: response.to_s
          }
        end
      end

      def next_page_number
        return nil if @error
        @meta[:current_page] < @meta[:total_pages] ? @meta[:current_page] + 1 : nil
      end

    end

  end
end
