require 'spec_helper'
require_relative '../lib/log_reader'
require_relative '../lib/page_views_printer'

describe LogReader do
  let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }
  let(:command_line_args) { "--file ruby.rb #{file}" }

  describe '#initialize' do
    context 'reads ARGV from command line' do
      before { ARGV = command_line_args.split }

      it 'chooses file with right extension from ARGV' do
        expect(described_class.new.file).to eq file
      end
    end

    context 'file is not provided' do
      it 'raises error if file does not exist' do
        ARGV = []
        expect { described_class.new.file }.to raise_error 'provide a valid file'
      end
    end
  end

  describe '.print_page_views' do
    context 'calls PageViewsCounter' do
      let(:page_views_hash) { {'/home': 4, '/help_page/1': 5, '/about': 2}  }
      let(:unique_page_views_hash) do
        {
          "/home" => 4,
          "/help_page/1" => 5,
          "/about" => 2
        }
      end

      before { ARGV = command_line_args.split }

      it 'calls printer class' do
        expect(PageViewsPrinter)
          .to receive(:call)
          .with(page_views_hash, unique_page_views_hash)

        described_class.print_page_views
      end
    end
  end
end
