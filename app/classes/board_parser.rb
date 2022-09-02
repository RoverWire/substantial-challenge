class BoardParser
  attr_accessor :teams

  def initialize
    @teams = Hash.new { |h, k| h[k] = [] }
    @teams.default = 0
  end

  def load_data(file_path)
    return unless self.class.valid_file?(file_path)

    File.foreach(file_path) do |game|
      data = parse_game(game)
      update_teams_score(data)
    end

    sort_teams
  end

  def self.valid_file?(file_name)
    return true unless file_name.nil? || file_name.empty? || !File.exist?(file_name)

    false
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

  def sort_teams
    return unless @teams.size.positive?

    @teams = @teams.to_a.sort_by { |k, v| [-v, k] }.to_h
  end
end
