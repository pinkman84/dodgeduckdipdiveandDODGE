require('pg')
require_relative('match')
require_relative('team')

class League
  attr_reader(:teams, :total_points)
  def initialize(teams)
    @teams = teams
  end

  # def total_points
  #  total = 0
  #   for team in @teams
  #     total += (team.winner + 3)
  #   end
  #   return total
  # end

  




end