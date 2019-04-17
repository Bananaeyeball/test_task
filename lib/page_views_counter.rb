class PageViewsCounter
  def self.call(file)
    new(file).call
  end
  private_class_method :new

  def initialize(file)
    @file = file
  end

  def call
    build_page_views_count_hash.group_by do |k, v|
      v
    end
  end

  private
 attr_reader :file

  def build_page_views_count_hash
    IO.readlines(file).reduce(Hash.new(0)) { |acc, line| acc[line.split.first.to_sym] += 1; acc }.sort_by { |k, v| -v }
  end
end
