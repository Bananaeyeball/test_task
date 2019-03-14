require_relative 'page_views_counter'

class LogReader
  def self.most_page_views
    new.most_page_views
  end

  def initialize
    @file = file_name_from_argv
  end
  attr_reader :file

  def most_page_views
    PageViewsCounter.call(file)
  end

  private

  def file_name_from_argv
    ARGV.select { |arg| /([a-zA-Z0-9\s_\\.\-\(\):])+(.log)$/ =~ arg }.first
  end
end
