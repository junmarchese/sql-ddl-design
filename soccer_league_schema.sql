DROP DATABASE IF EXISTS soccer_league_schema;

CREATE DATABASE soccer_league_schema;

\c soccer_league_schema

CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    city VARCHAR(200)
);

CREATE TABLE Referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

CREATE TABLE Seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    birthday DATE,
    height NUMERIC(3, 2), -- Height in meters
    current_team_id INTEGER REFERENCES teams(team_id)
);

CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(team_id),
    away_team_id INTEGER REFERENCES teams(team_id),
    location VARCHAR(200),
    match_date DATE,
    start_time TIME,
    season_id INTEGER REFERENCES seasons(season_id),
    head_referee_id INTEGER REFERENCES referees(referee_id),
    assistant_referee_1_id INTEGER REFERENCES referees(referee_id),
    assistant_referee_2_id INTEGER REFERENCES referees(referee_id)
    );

CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(player_id),
    match_id INTEGER REFERENCES matches(match_id)
);

CREATE TABLE Lineups (
    lineup_id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players(player_id),
    match_id INTEGER REFERENCES matches(match_id), 
    team_id INTEGER REFERENCES teams(team_id)
);

CREATE TABLE Results (
    result_id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(team_id),
    match_id INTEGER REFERENCES matches(match_id),
    result VARCHAR(4) CHECK (result IN ('win', 'loss', 'draw'))
);