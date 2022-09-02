require_relative '../../app/classes/board_parser'

describe 'BoardParser' do
  let(:hash_teams) { { 'Bears' => 1, 'Snakes' => 5, 'Ants' => 0 } }
  let(:alphabetical_teams) { { 'Bears' => 5, 'Beers' => 5, 'Bars' => 5, 'Zoo' => 3 } }

  before(:all) do
    @parser = BoardParser.new
  end

  describe '#parse_game' do
    it 'parse a string and returns an array of hashes with game info' do
      game = @parser.send(:parse_game, 'Tarantulas 3, Snakes 1')
      expect(game).to eq [{ name: 'Tarantulas', goals: 3 }, { name: 'Snakes', goals: 1 }]
      expect(game.is_a?(Array)).to be_truthy
      expect(game[0].is_a?(Hash)).to be_truthy
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

  describe '#sort_teams' do
    it 'should order from most to least points' do
      @parser.teams = hash_teams
      @parser.send(:sort_teams)
      expect(@parser.teams).to eq({ 'Snakes' => 5, 'Bears' => 1, 'Ants' => 0 })
    end

    it 'should order alphabetical order after points' do
      @parser.teams = alphabetical_teams
      @parser.send(:sort_teams)
      expect(@parser.teams).to eq({ 'Bars' => 5, 'Bears' => 5, 'Beers' => 5, 'Zoo' => 3 })
    end
  end

  describe '#output_results' do
    it 'outputs list ordered by points' do
      @parser.teams = hash_teams
      expectation = expect { @parser.output_results }
      expectation.to output(include('1. Snakes', '2. Bears', '3. Ants')).to_stdout
    end

    it 'outputs list ordered by name' do
      @parser.teams = alphabetical_teams
      expectation = expect { @parser.output_results }
      expectation.to output(include('1. Bars', '2. Bears', '3. Beers')).to_stdout
    end
  end
end
