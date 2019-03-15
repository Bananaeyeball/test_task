require_relative 'page_views_counter'
require_relative 'unique_page_views_counter'
require_relative 'page_views_printer'

class LogReader
  def self.print_page_views
    new.print_page_views
  end

  def initialize
    @file = file_name_from_argv
  end
  attr_reader :file

  def print_page_views
    PageViewsPrinter.call(page_views_hash, unique_page_views_hash)
  end

  private

  def page_views_hash
    PageViewsCounter.call(file)
  end

  def unique_page_views_hash
    UniquePageViewsCounter.call(file)
  end


  def file_name_from_argv
    ARGV.select { |arg| /([a-zA-Z0-9\s_\\.\-\(\):])+(.log)$/ =~ arg }.first
  end
end

# LogReader.print_page_views
