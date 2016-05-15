require('pg')

class Team
  attr_accessor(:team_id, :name, :hometown, :players, :total_wins, :defeated)
  def initialize(options)
    @team_id = options['team_id'].to_i
    @name = options['name']
    @hometown = options['hometown']
    @players = 6    
    @total_wins = 0
  end

  def save
    sql = "INSERT INTO teams (name, hometown) VALUES ('#{@name}', '#{@hometown}') RETURNING *"
    return Team.map_item(sql)
  end

  def self.all
    sql = "SELECT * FROM teams"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def lose_player
    dodgeball = ['hit', 'miss'].sample
    if  dodgeball == 'hit'
      @players -= 1
    end
  end

  def defeated
    until @players == 0
      lose_player
    end

  end



  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map { |team| Team.new(team)}
  end

  def self.map_item(sql)
    result = Team.map_items(sql)
    return result.first
  end

end
