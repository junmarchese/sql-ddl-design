INSERT INTO teams (name, city) VALUES
    ('Real Madrid', 'Madrid'),
    ('Barcelona', 'Barcelona');

INSERT INTO referees (name) VALUES
('Nestor Pistana'),
('Szymon Marciniak'),
('Soto Grado');

INSERT INTO seasons (start_date, end_date) VALUES
('2023-07-21', '2023-08-19'),
('2023-08-01', '2024-05-31');

INSERT INTO players (name, birthday, height, current_team_id) VALUES
    ('Lionel Messi', '1987-06-24', 1.70, 2),
    ('Cristiano Ronaldo', '1985-02-05', 1.87, 1);

INSERT INTO matches (home_team_id, away_team_id, location, match_date, start_time, season_id, head_referee_id, assistant_referee_1_id, assistant_referee_2_id) VALUES
(1, 2, 'Santiago Bernabeu', '2023-10-28', '20:30:00', 1, 1, 2, 3),
(2, 1, 'Camp Nou', '2024-03-15', '18:00:00', 1, 2, 1, 3);

INSERT INTO goals (player_id, match_id) VALUES
(1, 3),
(2, 4);

INSERT INTO lineups (player_id, match_id, team_id) VALUES
(1, 3, 1),
(2, 4, 2),
(1, 4, 2),
(2, 3, 1);

INSERT INTO results (team_id, match_id, result) VALUES
(1, 3, 'win'),
(2, 4, 'loss'),
(2, 3, 'win'),
(1, 4, 'loss');