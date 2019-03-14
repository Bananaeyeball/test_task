require 'spec_helper'
require_relative '../lib/log_reader'

describe LogReader do

  let(:file) { 'home/user/logfile.log' }

  describe '#initialize' do
    context 'reads ARGV from command line' do
      let(:command_line_args) { '--file ruby.rb home/user/logfile.log' }
      before { ARGV = command_line_args.split }

      it 'chooses file with right extension from ARGV' do
        expect(described_class.new.file).to eq file
      end
    end
  end

  describe '.most_page_views' do
    context 'calls PageViewsCounter' do
      it do
        expect(PageViewsCounter).to receive(:call).with(file).and_call_original
        described_class.most_page_views
      end
    end
  end
end
