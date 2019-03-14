class PageViewsCounter
  def self.call(file)
    new(file).call
  end

  def initialize(file)
    @file = file
  end
  attr_reader :file

  def call
    build_page_views_count_hash
  end

  private

  def build_page_views_count_hash
    a = Hash.new(0)
    IO.readlines(file).each { |line| a[line.split.first.to_sym] += 1  }
    a
    # dont get why this doesn't work
    # IO.readlines(file).reduce(Hash.new(0)) { |acc, line| acc[line.split.first.to_sym] += 1  }
  end
end
