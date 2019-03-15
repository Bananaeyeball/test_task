require 'spec_helper'
require_relative '../lib/unique_page_views_counter'

describe UniquePageViewsCounter do
  describe '.call' do
    context 'returns most page views count hash' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }

    let(:hash) do
      {
        "/home" => 4,
        "/help_page/1" => 5,
        "/about" => 2,
      }
    end

      it do
        expect(described_class.call(file)).to eq(hash)
      end
    end
  end
end
