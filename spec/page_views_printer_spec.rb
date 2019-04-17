require 'spec_helper'
require_relative '../lib/page_views_printer'

describe PageViewsPrinter do
  describe '.call' do
    context 'prints views to stdout' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }
      let(:page_views_array) { [[:"/help_page/1", 5], [:"/home", 4], [:"/about", 2]]  }
      let(:output_file) { Dir.pwd + '/spec/fixtures/output.txt' }
      let(:output_text) { File.read(output_file)  }
      let(:unique_page_views_array) do
        [["/help_page/1", 5], ["/home", 4], ["/about", 2]]
      end

      it 'prints views to stdout' do
        expect { described_class.call(page_views_array, unique_page_views_array) }
          .to output(output_text)
          .to_stdout
      end
    end
  end
end
