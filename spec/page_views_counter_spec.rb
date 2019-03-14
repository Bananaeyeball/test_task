require 'spec_helper'
require_relative '../lib/page_views_counter'
# require_relative '../spec/fixtures/logfile.log'

describe PageViewsCounter do
  describe '.call' do
    context 'returns most page views count hash' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }

    let(:hash) { {'/home': 4, '/help_page/1': 5, '/about': 2}  }
      it do
        expect(described_class.call(file)).to eq(hash)
      end
    end
  end
end
