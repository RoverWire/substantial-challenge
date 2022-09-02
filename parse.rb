require 'optparse'
require_relative 'app/app'
require_relative 'app/classes/board_parser'

options = { input: '' }
ARGV << '-h' if ARGV.empty?

OptionParser.new do |parser|
  parser.banner = 'Parse soccer games information from a file'
  parser.separator "Usage: #{$PROGRAM_NAME} [options]"
  parser.separator ''
  parser.separator 'Specific options:'

  parser.on_tail('-h', '--help', 'Show this message') do
    puts parser
    exit
  end

  parser.on('-i [STRING]', '--input [STRING]', 'Provides a file input path') do |value|
    options[:input] = value
  end
end.parse!

App.run(options[:input])
