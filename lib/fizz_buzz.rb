class FizzBuzz
  def self.fizz_buzz(upper_reach)
    1.upto(upper_reach).map do |item|
      if item % 3 + item % 5 == 0
        'Fizz Buzz'
      elsif item % 5 == 0
        'Buzz'
      elsif item % 3 == 0
        'Fizz'
      else
        item
      end
    end
  end
end
