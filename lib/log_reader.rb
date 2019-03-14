class LogReader
  def initialize
    @file = ARGV.select { |arg| /([a-zA-Z0-9\s_\\.\-\(\):])+(.log)$/ =~ arg }.first
  end
  attr_reader :file
end
