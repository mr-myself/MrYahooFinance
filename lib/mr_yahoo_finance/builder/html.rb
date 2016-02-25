require 'open-uri'
require 'nokogiri'

module MrYahooFinance
  module Builder
    module Html

      class << self
        def row_html(path)
          begin
            Nokogiri::HTML(open(path))
          rescue Net::HTTPError
          end
        end

        def target_table_tr(html)
          html.css('table.yfnc_tabledata1 > tr > td > table > tr'){|tr| yield tr }
        end
      end
    end
  end
end
