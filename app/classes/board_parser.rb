class BoardParser
  attr_accessor :teams

  def initialize
    @teams = Hash.new { |h, k| h[k] = [] }
    @teams.default = 0
  end

  def load_data(file_path)
    File.foreach(file_path) do |game|
      data = parse_game(game)
      update_teams_score(data)
    end
  end

  def output_results
    order = 1
    data = @teams.to_a.sort_by { |k, v| [-v, k] }.to_h
    data.each do |k, v|
      puts "#{order}. #{k}, #{v} #{v == 1 ? 'pt' : 'pts'}"
      order += 1
    end
  end

  private

  def parse_game(data)
    data.split(',').map do |team|
      name = team.strip.rpartition(' ').first
      goals = team.strip.rpartition(' ').last.to_i

      { name: name, goals: goals }
    end
  end

  def update_teams_score(game)
    @teams[game[0][:name]] += get_game_score(game[0][:goals], game[1][:goals])
    @teams[game[1][:name]] += get_game_score(game[1][:goals], game[0][:goals])
  end

  def get_game_score(team_goals, rival_goals)
    return 3 if team_goals > rival_goals
    return 1 if team_goals == rival_goals

    0
  end
end
