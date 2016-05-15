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
  team1_id INT4 references teams(id),
  team2_id  INT4 references teams(id),
  winner INT4 references teams(id)
);

CREATE TABLE league (
  id SERIAL4 primary key,
  teams INT4 references teams(id),
  total_points INT4
);

CREATE TABLE players (
  id SERIAL4 primary key,
  name VARCHAR(255),
  team_id INT4 references teams(id)
);

CREATE TABLE coach (
  id SERIAL4 primary key,
  name VARCHAR(255),
  team_id INT4 references  teams(id)
);