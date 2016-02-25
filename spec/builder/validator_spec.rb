require 'spec_helper'

describe MrYahooFinance::Builder::Validator do
  include MrYahooFinance::Builder::Validator

  let(:correct_html) do
    MrYahooFinance::Builder::Html.row_html('spec/fixtures/sample.html')
  end

  let(:wrong_html) do
    MrYahooFinance::Builder::Html.row_html('spec/fixtures/empty.html')
  end

  describe 'valid?' do
    let(:target_text) { 'Profit' }
    let(:matchable_html) do
      correct_html.css('table.yfnc_tabledata1 tr td table tr')[4]
    end
    let(:unmatchable_html) do
      correct_html.css('table.yfnc_tabledata1 tr td table tr')[2]
    end

    context 'the text matches' do
      subject { valid?(matchable_html, target_text) }

      it 'returns true' do
        expect(subject).to be_truthy
      end
    end

    context 'the text does not matches' do
      subject { valid?(unmatchable_html, target_text) }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end

  describe 'parseable?' do

    context 'the html is appropriate' do
      subject { parseable?(correct_html) }

      it 'returns true' do
        expect(subject).to be_truthy
      end
    end

    context 'the html is not appropriate' do
      subject { parseable?(wrong_html) }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end
end
