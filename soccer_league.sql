DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

/c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team TEXT NOT NULL,
  ranking INTEGER 
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  player TEXT NOT NULL,
  team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  referee TEXT NOT NULL
);

CREATE TABLE season
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  game_date DATE NOT NULL,
  -- If there is a set number of the same thing (such as 2 teams in a game), 
  -- is this the best way to 1) name them if there is no distintion between the
  -- two, and 2) map to in a table or is there a better method?
  team_1_id INTEGER REFERENCES teams ON DELETE SET NULL,
  team_2_id INTEGER REFERENCES teams ON DELETE SET NULL,
  referee_id INTEGER REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players ON DELETE SET NULL,
  game_id INTEGER REFERENCES games ON DELETE SET NULL,
);

INSERT INTO teams
  (team, ranking)
VALUES
  ('Dynamo', 2),
  ('FC Dallas', 5);

INSERT INTO players
  (players, team_id)
VALUES
  ('Tim Parker', 1),
  ('Justin Che', 2);

INSERT INTO referees
  (referee)
VALUES
  ('Alec Para'),
  ('John Brownman');

INSERT INTO seasons
  (start_date, end_date)
VALUES
  ('2018-04-08', '2018-07-08'),
  ('2020-04-08', '2020-07-08');

INSERT INTO games
  (game_date, team_1_id, team_2_id, referee_id)
VALUES
  ('2018-04-08', 1, 2, 2),
  ('2018-04-08', 2, 1, 1);

INSERT INTO goals
  (player_id, game_id)
VALUES
  (1, 2),
  (1, 1),
  (2, 2);

