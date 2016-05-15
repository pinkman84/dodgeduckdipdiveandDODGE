require('pg')
require_relative('match')
require_relative('team')

class League
  attr_reader(:teams, :points_total)
  def initialize(options)
    @teams = options['teams']
    @games_won = options['games_won']
    @points_total = options['points_total']
  end

  def points_total
    total = @teams.inject(0) { |sum, team| sum + @games_won } * 3
    
    return total
    
  end

  




end