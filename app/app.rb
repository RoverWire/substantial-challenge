require_relative 'classes/board_parser'

DEFAULT_INPUT = 'sample-input.txt'.freeze

board = BoardParser.new
board.load_data(DEFAULT_INPUT)
board.output_results
