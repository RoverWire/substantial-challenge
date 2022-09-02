describe 'App' do
  let(:alphabetical_teams) { { 'Bars' => 5, 'Bears' => 5, 'Beers' => 5, 'Zoo' => 3 } }
  let(:hash_teams) { { 'Snakes' => 5, 'Bears' => 1, 'Ants' => 0 } }

  describe '#run' do
    it 'performs file parser' do
      expectation = expect { App.run('sample-input.txt') }
      expectation.to output(include('1. Tarantulas, 6 pts')).to_stdout
    end

    it 'outputs messages if file error' do
      expectation = expect { App.run('foo.txt') }
      expectation.to output("#{App.error_message(:invalid_file)}\n").to_stdout
    end

    it 'outputs messages if no games content found' do
      expectation = expect { App.run('README.md') }
      expectation.to output("#{App.error_message(:invalid_content)}\n").to_stdout
    end
  end

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

  describe '#error_message' do
    it 'returns an string' do
      expect(App.error_message(:invalid_file).is_a?(String)).to be_truthy
    end

    it 'can handle unexpected values' do
      expect(App.error_message(123).is_a?(String)).to be_truthy
      expect(App.error_message(nil).is_a?(String)).to be_truthy
      expect(App.error_message(:foo_value).is_a?(String)).to be_truthy
    end
  end
end
