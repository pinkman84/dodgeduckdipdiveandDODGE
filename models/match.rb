require('pg')
require_relative('player')

class Match
  attr_accessor(:id, :team1_id, :team2_id, :winner)
  def initialize(options)
    @id = options['id'].to_i
    @team1_id = options['team1_id'].to_i
    @team2_id = options['team2_id'].to_i
    @winner = options['winner'].to_i
  end

  def save
    sql = "INSERT INTO matches (team1_id, team2_id, winner) VALUES (#{@team1_id}, #{@team2_id}, #{@winner} ) RETURNING *"
    return Match.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

  # def victor
  #   if team1_id.players = 0
  #     puts "Team 2 are the winners"
  #   elsif team2_id.players = 0
  #     puts "Team 1 are the winners"
  #   end
  # end

  def self.map_items(sql)
    matches = SqlRunner.run(sql)
    result = matches.map { |match| Match.new(match) }
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end



end