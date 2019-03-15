require 'spec_helper'
require_relative '../lib/page_views_counter'

describe UniquePageViewsCounter do
  describe '.call' do
    context 'returns most page views count hash' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }

    let(:hash) { {'/home': 1, '/help_page/1': 1, '/about': 1}  }
      it do
        expect(described_class.call(file)).to eq(hash)
      end
    end
  end
end
