require_relative('models/team')
require_relative('models/match')
require_relative('models/league')
require_relative('db/sql_runner.rb')
require('pry-byebug')




team1 = Team.new( {'name' => 'Average Joes', 'hometown' => 'Anytown. USA'})
team2 = Team.new( {'name' => 'Globogym Purple Cobras', 'hometown' => 'Anytown. USA'})
team3 = Team.new( {'name' => 'cx3-4 Ball Busters', 'hometown' => 'Edinburgh. SCO'})
team4 = Team.new( {'name' => 'the 5 Ds', 'hometown' => 'Anytown. USA'})

t1 = team1.save
t2 = team2.save
t3 = team3.save
t4 = team4.save

match1 = Match.new( {'team1_id' => t1.id, 'team2_id' => t2.id, 'winner' => t1.id})
match2 = Match.new( {'team1_id' => t3.id, 'team2_id' => t4.id, 'winner' => t3.id})
match3 = Match.new( {'team1_id' => t1.id, 'team2_id' => t3.id, 'winner' => t3.id})
match4 = Match.new( {'team1_id' => t2.id, 'team2_id' => t4.id, 'winner' => t2.id})
match5 = Match.new( {'team1_id' => t1.id, 'team2_id' => t4.id, 'winner' => t1.id})
match6 = Match.new( {'team1_id' => t2.id, 'team2_id' => t3.id, 'winner' => t2.id})

m1 = match1.save
m2 = match2.save
m3 = match3.save
m4 = match4.save
m5 = match5.save
m6 = match6.save

binding.pry
nil