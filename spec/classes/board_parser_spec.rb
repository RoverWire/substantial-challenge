require_relative '../../app/classes/board_parser'

describe 'BoardParser' do
  before(:all) do
    @parser = BoardParser.new
  end

  describe '#parse_game' do
    it 'parse a string and returns a hash with game info' do
      game = @parser.send(:parse_game, 'Tarantulas 3, Snakes 1')
      expect(game).to eq [{ name: 'Tarantulas', goals: 3 }, { name: 'Snakes', goals: 1 }]
    end

    it 'can handle team names with digits' do
      game = @parser.send(:parse_game, 'Sense8 3, Eiffel 65 1')
      expect(game).to eq [{ name: 'Sense8', goals: 3 }, { name: 'Eiffel 65', goals: 1 }]
    end

    it 'can support team names with several words' do
      game = @parser.send(:parse_game, 'The Ocean eleven greatest team 3, Snakes 1')
      expect(game).to eq [{ name: 'The Ocean eleven greatest team', goals: 3 }, { name: 'Snakes', goals: 1 }]
    end
  end
end
