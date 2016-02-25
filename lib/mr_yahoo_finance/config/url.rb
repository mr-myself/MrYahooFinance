module MrYahooFinance
  module Config
    module Url

      def self.annual(symbol)
        "https://finance.yahoo.com/q/is?s=#{symbol}+Income+Statement&annual".freeze
      end

      def self.quarterly(symbol)
        "https://finance.yahoo.com/q/is?s=#{symbol}".freeze
      end
    end
  end
end
