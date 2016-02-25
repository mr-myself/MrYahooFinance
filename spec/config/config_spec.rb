require 'spec_helper'

describe MrYahooFinance::Config do

  describe 'VERSION' do
    it 'has a version number' do
      expect(MrYahooFinance::Config::VERSION).not_to be nil
    end
  end

  describe 'TERMS_COUNT' do
    let(:annual)    { 3 }
    let(:quarterly) { 4 }

    subject { MrYahooFinance::Config::TERMS_COUNT }

    it 'returns same number' do
      expect(subject[:annual]).to eq(annual)
      expect(subject[:quarterly]).to eq(quarterly)
    end
  end

  describe 'Indicator::ALL' do
    let(:keys) { [:period, :sale, :operating_profit, :net_income] }
    subject { MrYahooFinance::Config::Indicator::ALL }

    it 'prepared appropriate keys' do
      subject.each_key do |key|
        expect(keys.include?(key)).to be_truthy
      end
    end

    it 'exists values' do
      subject.each_value do |value|
        expect(value).not_to be_nil
      end
    end
  end

  describe 'Url' do
    let(:symbol) { 'YHOO' }
    subject { MrYahooFinance::Config::Url }

    it 'returns URL' do
      expect(subject.annual(symbol)).to match /https:\/\//
      expect(subject.quarterly(symbol)).to match /https:\/\//
    end
  end
end
