class PageViewsCounter
  def self.call(file)
    new(file).call
  end

  def initialize(file)
    @file = file
  end
  attr_reader :file

  def call
    a = Hash.new(0)
    IO.readlines(file).each { |line| a[line.split.first.to_sym] += 1  }
    a
  end
end
