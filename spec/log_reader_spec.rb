require 'spec_helper'
require 'active_support/core_ext/kernel/reporting'
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

  describe '.most_page_views' do
    context 'calls PageViewsCounter' do
      let(:file) { Dir.pwd + '/spec/fixtures/logfile.log' }
      let(:output_file) { Dir.pwd + '/spec/fixtures/output.txt' }
      let(:output) { File.read(file)  }

      it do
        expect(PageViewsCounter).to receive(:call).with(file)
        described_class.most_page_views
      end

      it 'prints pages with views counts in descending order' do
        expect(described_class.most_page_views).to output.to_stdout
      end
    end
  end
end
