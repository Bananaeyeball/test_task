require 'spec_helper'
require_relative '../lib/log_reader'

describe LogReader do

  let(:command_line_args) { "--file ruby.rb #{file}" }
  before { ARGV = command_line_args.split }

  describe '#initialize' do
    context 'reads ARGV from command line' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }

      it 'chooses file with right extension from ARGV' do
        expect(described_class.new.file).to eq file
      end
    end
  end

  describe '.print_page_views' do
    context 'calls PageViewsCounter' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }
      let(:output_file) { Dir.pwd + '/spec/fixtures/output.txt' }
      let(:output) { File.read(file)  }
      let(:page_views_hash) { {'/home': 4, '/help_page/1': 5, '/about': 2}  }
      let(:unique_page_views_hash) do
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

      it 'calls printer class' do
        expect(PageViewsPrinter)
          .to receive(:call)
          .with(page_views_hash, unique_page_views_hash)
          .and_call_original
        described_class.print_page_views
      end
    end
  end
end
