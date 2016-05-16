require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league')
require_relative('../models/team')
require_relative('../models/match')

class TestLeague < Minitest::Test

  def setup
    @team1 = Team.new({'name' => 'Average Joes', 'hometown' => 'Anytown, USA'})
    @team2 = Team.new({'name' => 'Globogym Purple Cobras', 'hometown' => 'Anytown, USA'})

    match1 = Match.new( {'team1_id' => t1.team_id, 'team1_player' => t1.players, 'team2_id' => t2.team_id, 'team2_player' => t2.players, 'winner' => t1.team_id})

  end


end