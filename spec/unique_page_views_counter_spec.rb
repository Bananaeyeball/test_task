require 'spec_helper'
require_relative '../lib/unique_page_views_counter'

describe UniquePageViewsCounter do
  describe '.call' do
    context 'returns most page views count hash' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }

    let(:hash) do
      {
        "/home 316.433.849.805\n" => 2,
        "/help_page/1 126.318.035.038\n" => 1,
        "/home 184.123.665.067\n" => 1,
        "/about 444.701.448.104\n" => 1,
        "/help_page/1 929.398.951.889\n" => 1,
        "/help_page/1 722.247.931.582\n" => 1,
        "/about 061.945.150.735\n" => 1,
        "/help_page/1 646.865.545.408\n" => 1,
        "/home 235.313.352.950\n" => 1,
        "/help_page/1 543.910.244.929\n" => 1
      }
    end

      it do
        expect(described_class.call(file)).to eq(hash)
      end
    end
  end
end
