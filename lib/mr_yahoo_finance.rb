require 'mr_yahoo_finance/profit_and_loss'
require 'mr_yahoo_finance/builder/format'
require 'mr_yahoo_finance/builder/html'
require 'mr_yahoo_finance/builder/validator'
require 'mr_yahoo_finance/config/config'
require 'mr_yahoo_finance/config/indicator'
require 'mr_yahoo_finance/config/url'
require 'mr_yahoo_finance/config/version'


module MrYahooFinance

  def self.get(symbol)
    mr_yahoo_finance = MrYahooFinance.new(symbol)
    mr_yahoo_finance.fetch
  end

  class MrYahooFinance
    def initialize(symbol)
      @symbol = symbol
    end

    def fetch
      {}.tap do |data|
        data[:annual]    = ProfitAndLoss.get(@symbol, :annual)
        data[:quarterly] = ProfitAndLoss.get(@symbol, :quarterly)
      end
    end
  end
end
