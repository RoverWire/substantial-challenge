describe 'App' do
  let(:alphabetical_teams) { { 'Bars' => 5, 'Bears' => 5, 'Beers' => 5, 'Zoo' => 3 } }
  let(:hash_teams) { { 'Snakes' => 5, 'Bears' => 1, 'Ants' => 0 } }

  describe '#output' do
    it 'prints list ordered by points' do
      expectation = expect { App.output(hash_teams) }
      expectation.to output(include('1. Snakes, 5 pts', '2. Bears, 1 pt', '3. Ants, 0 pts')).to_stdout
    end

    it 'prints list ordered by name' do
      expectation = expect { App.output(alphabetical_teams) }
      expectation.to output(include('1. Bars', '2. Bears', '3. Beers')).to_stdout
    end
  end
end
