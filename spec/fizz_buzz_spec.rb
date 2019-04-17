require 'spec_helper'
require_relative '../lib/fizz_buzz'

describe FizzBuzz do
  describe '.fizz_buzz' do
    subject { described_class.fizz_buzz(upper_reach) }

    let(:upper_reach) { 15 }
    let(:expected_result) {  [ 1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11,'Fizz', 13, 14, 'Fizz Buzz' ] }

    it 'prints everything correctly' do
      expect(subject).to eq expected_result
    end
  end
end
