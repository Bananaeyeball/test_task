require 'spec_helper'
require_relative '../lib/log_reader'

describe LogReader do

  describe '.read_file' do
    context 'reads ARGV from command line' do
      let(:command_line_args) { '--file ruby.rb home/user/logfile.log' }
      before { ARGV = command_line_args.split }

      it 'chooses file with right extension from ARGV' do
        expect(described_class.new.file).to eq 'home/user/logfile.log'
      end
    end
  end
end
