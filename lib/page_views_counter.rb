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
    IO.readlines(file).reduce(Hash.new(0)) { |acc, line| acc[line.split.first.to_sym] += 1; acc  }
  end
end
