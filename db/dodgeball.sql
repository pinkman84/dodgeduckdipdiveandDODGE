DROP TABLE matches;
DROP TABLE league;
DROP TABLE players;
DROP TABLE coach;
DROP TABLE teams;

CREATE TABLE teams (
  team_id SERIAL4 primary key,
  name VARCHAR(255),
  hometown VARCHAR(255)
);

CREATE TABLE matches (
  id SERIAL4 primary key,
  team1_id INT4 references teams(team_id),
  team2_id  INT4 references teams(team_id),
  winner INT4 references teams(team_id)
);

CREATE TABLE league (
  id SERIAL4 primary key,
  teams INT4 references teams(team_id),
  games_won INT4,
  points_total INT4
);

CREATE TABLE players (
  id SERIAL4 primary key,
  name VARCHAR(255),
  team_id INT4 references teams(team_id)
);

CREATE TABLE coach (
  id SERIAL4 primary key,
  name VARCHAR(255),
  team_id INT4 references  teams(team_id)
);