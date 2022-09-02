require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'optparse'
require_relative 'app/app'
require_relative 'app/classes/board_parser'

desc 'Parse soccer games information from a file'
task :parse do
  ['--', '-h'].each { |x| ARGV << x } if ARGV.size == 1

  options = { input: '' }

  begin
    o = OptionParser.new
    o.banner = 'Usage: rake parse -- [options]'
    o.on('-i [STRING]', '--input [STRING]', 'Provides a file input path') do |value|
      options[:input] = value
    end

    o.on_tail('-h', '--help', 'Show this message') do
      puts o
      exit
    end

    args = o.order!(ARGV) {}
    o.parse!(args)

    App.run(options[:input])
  rescue OptionParser::InvalidOption
    puts App.error_message(:invalid_option)
  end
end

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)

task default: %i[spec rubocop]
