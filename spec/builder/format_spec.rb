require 'spec_helper'

describe MrYahooFinance::Builder::Format do

  let(:html) { MrYahooFinance::Builder::Html.row_html('spec/fixtures/sample.html') }

  describe MrYahooFinance::Builder::Format::Indicator do
    let(:target_html) { html.css('table.yfnc_tabledata1 tr td table tr')[1] }
    let(:revenues) do
      [4618133, -4680380, -4986566]
    end

    describe 'periods' do
      subject do
        MrYahooFinance::Builder::Format::Indicator.periods(
          html, MrYahooFinance::Config::TERMS_COUNT[:annual]
        )
      end

      it { expect(subject).to eq(revenues) }
    end
  end

  describe MrYahooFinance::Builder::Format::Period do

    let(:target_html) { html.css('table.yfnc_tabledata1 tr td table tr')[0] }
    let(:periods) do
      ["Dec 31, 2014", "Dec 31, 2013", "Dec 31, 2012"]
    end

    describe 'periods' do
      subject do
        MrYahooFinance::Builder::Format::Period.periods(
          html, MrYahooFinance::Config::TERMS_COUNT[:annual]
        )
      end

      it { expect(subject).to eq(periods) }
    end
  end
end
