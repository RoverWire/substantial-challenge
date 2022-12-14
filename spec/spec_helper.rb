require 'rake'
require_relative '../app/app'
require_relative '../app/classes/board_parser'
require_relative 'support/rake_helpers'

RSpec.configure do |config|
  config.color = true
  config.include RakeHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
