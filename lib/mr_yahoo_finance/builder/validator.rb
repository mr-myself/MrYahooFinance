module MrYahooFinance
  module Builder
    module Validator

      def valid?(tr, key_word)
        tr.css('td').text.include?(key_word)
      end

      def parseable?(html)
        html and html.css('table.yfnc_tabledata1').any?
      end
    end
  end
end
