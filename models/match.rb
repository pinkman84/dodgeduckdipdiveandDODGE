require('pg')

class Match
  attr_accessor(:id, :team1_id, :team2_id, :winner)
  def initialize(options)
    @id = options['id'].to_i
    @team1_id = options['team1_id'].to_i
    @team2_id = options['team2_id'].to_i
    @winner = winner
  end

  def save
    sql = "INSERT INTO matches (team1_id, team2_id, winner) VALUES (#{@team1_id}, #{@team2_id}, #{@winner} ) RETURNING *"
    return Match.map_item(sql)
  end

  def winner?
    if team1.players = 0
      winner = @team2_id
    elsif team2.players = 0
      winner = @team1_id
    end
    return winner
  end

  def self.map_items(sql)
    matches = SqlRunner.run(sql)
    result = matches.map { |match| Match.new(match) }
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end



end