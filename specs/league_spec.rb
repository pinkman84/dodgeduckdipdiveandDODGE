require('minitest/autorun')
require('minitest/rg')
require_relative('../models/league')
require_relative('../models/team')
require_relative('../models/match')

class TestLeague < Minitest::Test

  def setup
    @team1 = Team.new({'name' => 'Average Joes', 'hometown' => 'Anytown, USA'})
    @team2 = Team.new({'name' => 'Globogym Purple Cobras', 'hometown' => 'Anytown, USA'})

    @match = Match.new()

  end


end