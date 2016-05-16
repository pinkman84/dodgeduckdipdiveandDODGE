require('pg')
require_relative('player')

class Match
  attr_accessor(:id, :team1_id, :team2_id, :winner, :team1_player, :team2_player, :match_result)
  def initialize(options)
    @id = options['id'].to_i
    @team1_id = options['team1_id'].to_i
    @team1_player = options['team1_player'].to_i
    @team2_id = options['team2_id'].to_i
    @team2_player = options['team2_player'].to_i
    @winner = options['winner'].to_i
  end

  def save
    sql = "INSERT INTO matches (team1_id, team1_player, team2_id, team2_player, winner) VALUES (#{@team1_id}, #{team1_player}, #{@team2_id}, #{team2_player}, #{@winner} ) RETURNING *"
    return Match.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end


  def match_result
  
    if @team1_player > @team2_player
      @winner = @team1_id
    else
      @winner = @team2_id
    end

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