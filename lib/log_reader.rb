class LogReader
  def initialize
    @file = file_name_from_argv
  end
  attr_reader :file

  def file_name_from_argv
    ARGV.select { |arg| /([a-zA-Z0-9\s_\\.\-\(\):])+(.log)$/ =~ arg }.first
  end
end
