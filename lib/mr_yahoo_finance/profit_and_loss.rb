require 'mr_yahoo_finance/builder/validator'

module MrYahooFinance
  class ProfitAndLoss
    include MrYahooFinance::Builder::Validator

    class << self
      def get(symbol, term)
        profit_and_loss = new(symbol, term)
        profit_and_loss.fetch
        profit_and_loss.data
      end
    end

    attr_reader :data

    def initialize(symbol, term)
      @symbol = symbol
      @term = term
      @data = Array.new(Config::TERMS_COUNT[@term]){ Hash.new }
    end

    def fetch
      build_html
      parse_html if parseable?(@html)
    end

  private
    def build_html
      @html = Builder::Html.row_html Config::Url.send(@term.to_s, @symbol)
    end

    def parse_html
      target_table_tr do |tr|
        Config::Indicator::ALL.each do |key, value|
          build_periods(tr, key) if valid?(tr, value)
        end
      end
    end

    def target_table_tr
      Builder::Html.target_table_tr(@html).each{|tr| yield tr }
    end

    def build_periods(tr, base)
      case base
      when :period
        format_periods(tr) do |hash|
          @data.each_with_index{|data, i| data[base] = hash[i]}
        end
      else
        format_indicators(tr) do |hash|
          @data.each_with_index{|data, i| data[base] = hash[i]}
        end
      end
    end

    def format_periods(tr)
      Builder::Format::Period.periods(tr, Config::TERMS_COUNT[@term]).tap{|array| yield array }
    end

    def format_indicators(tr)
      Builder::Format::Indicator.periods(tr, Config::TERMS_COUNT[@term]).tap{|array| yield array }
    end
  end
end
