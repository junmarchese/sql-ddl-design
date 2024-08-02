INSERT INTO airlines (name) VALUES
  ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'),
  ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO countries (name) VALUES
  ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'),
  ('France'), ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');

INSERT INTO passengers (first_name, last_name) VALUES
  ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO cities (name, country_id) VALUES
  ('Washington DC', 1), ('Seattle', 1), ('Tokyo', 2), ('London', 3),
  ('Los Angeles', 1), ('Las Vegas', 1), ('Mexico City', 4), ('Paris', 5),
  ('Casablanca', 6), ('Dubai', 7), ('Beijing', 8), ('New York', 1),
  ('Charlotte', 1), ('Cedar Rapids', 1), ('Chicago', 1), ('New Orleans', 1),
  ('Sao Paolo', 9), ('Santiago', 10);

INSERT INTO flights (airline_id, from_city_id, to_city_id, departure, arrival) VALUES
  (1, 1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (2, 3, 4, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (3, 5, 6, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (3, 2, 7, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (4, 8, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (5, 10, 11, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (1, 12, 13, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (6, 14, 15, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (6, 13, 16, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (7, 17, 18, '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO tickets (passenger_id, flight_id, seat) VALUES
  (1, 1, '33B'), (2, 2, '8A'), (3, 3, '12F'), (1, 4, '20A'),
  (4, 5, '23D'), (2, 6, '18C'), (5, 7, '9E'), (6, 8, '1A'),
  (5, 9, '32B'), (7, 10, '10D');



-- sample queries

-- to query a flight's from_country and to_country:
SELECT 
  f.id AS flight_id,
  fc.name AS from_city,
  fco.name AS from_country,
  tc.name AS to_city,
  tco.name AS to_country
FROM 
  flights f
  JOIN cities fc ON f.from_city_id = fc.id
  JOIN countries fco ON fc.country_id = fco.id
  JOIN cities tc ON f.to_city_id = tc.id
  JOIN countries tco ON tc.country_id = tco.id;

-- list all passengers with their ticket information:
SELECT 
  p.first_name, 
  p.last_name, 
  t.seat, 
  f.departure, 
  f.arrival
FROM 
  passengers p
  JOIN tickets t ON p.id = t.passenger_id
  JOIN flights f ON t.flight_id = f.id;

-- show all flights with airline names, departure, and arrival cities
SELECT 
  a.name AS airline,
  fc.name AS from_city,
  tc.name AS to_city,
  f.departure,
  f.arrival
FROM 
  flights f
  JOIN airlines a ON f.airline_id = a.id
  JOIN cities fc ON f.from_city_id = fc.id
  JOIN cities tc ON f.to_city_id = tc.id;

-- list all international flights
SELECT 
  a.name AS airline,
  fc.name AS from_city,
  fco.name AS from_country,
  tc.name AS to_city,
  tco.name AS to_country,
  f.departure,
  f.arrival
FROM 
  flights f
  JOIN airlines a ON f.airline_id = a.id
  JOIN cities fc ON f.from_city_id = fc.id
  JOIN countries fco ON fc.country_id = fco.id
  JOIN cities tc ON f.to_city_id = tc.id
  JOIN countries tco ON tc.country_id = tco.id
WHERE 
  fco.id != tco.id;

-- count number of flights for each airline
SELECT 
  a.name AS airline, 
  COUNT(*) AS flight_count
FROM 
  flights f
  JOIN airlines a ON f.airline_id = a.id
GROUP BY 
  a.id, a.name
ORDER BY 
  flight_count DESC;

-- find passengers who have taken more than one flight
SELECT 
  p.first_name, 
  p.last_name, 
  COUNT(*) AS flight_count
FROM 
  passengers p
  JOIN tickets t ON p.id = t.passenger_id
GROUP BY 
  p.id, p.first_name, p.last_name
HAVING 
  COUNT(*) > 1;

-- list all cities and their countries
SELECT 
  ci.name AS city, 
  co.name AS country
FROM 
  cities ci
  JOIN countries co ON ci.country_id = co.id
ORDER BY 
  co.name, ci.name;

-- find the longest flight by duration
SELECT 
  a.name AS airline,
  fc.name AS from_city,
  tc.name AS to_city,
  f.departure,
  f.arrival,
  (f.arrival - f.departure) AS duration
FROM 
  flights f
  JOIN airlines a ON f.airline_id = a.id
  JOIN cities fc ON f.from_city_id = fc.id
  JOIN cities tc ON f.to_city_id = tc.id
ORDER BY 
  duration DESC
LIMIT 1;

-- list all flights departing from the United States
SELECT 
  a.name AS airline,
  fc.name AS from_city,
  tc.name AS to_city,
  f.departure
FROM 
  flights f
  JOIN airlines a ON f.airline_id = a.id
  JOIN cities fc ON f.from_city_id = fc.id
  JOIN countries fco ON fc.country_id = fco.id
  JOIN cities tc ON f.to_city_id = tc.id
WHERE 
  fco.name = 'United States'
ORDER BY 
  f.departure;