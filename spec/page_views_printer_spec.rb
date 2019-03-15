require 'spec_helper'
require_relative '../lib/page_views_printer'

describe PageViewsPrinter do
  describe '.call' do
    context 'prints views to stdout' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }
      let(:page_views_hash) { {'/home': 4, '/help_page/1': 5, '/about': 2}  }
      let(:output_file) { Dir.pwd + '/spec/fixtures/output.txt' }
      let(:output) { File.read(file)  }
      let(:unique_page_views_hash) do
        {
          "/home" => 5,
          "/help_page/1" => 4,
          "/about" => 2
        }
      end

      it 'prints views to stdout' do
        expect { described_class.call(page_views_hash, unique_page_views_hash) }
          .to output(output)
          .to_stdout
      end
    end
  end
end