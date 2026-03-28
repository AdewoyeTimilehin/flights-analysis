-- 1
SELECT DISTINCT carrier
FROM flights;

-- 2
SELECT COUNT(*) AS total_flights
FROM flights;

-- 3
SELECT DISTINCT origin
FROM flights;

SELECT origin, COUNT(*) AS number_of_flight
FROM flights
GROUP BY origin;

-- 4
SELECT *
FROM flights
LIMIT 10;

-- 5
SELECT name
FROM airlines;

-- 6
SELECT *
FROM airports;

SELECT COUNT(*) AS number_of_airports
FROM airports;

-- 7
SELECT ROUND(AVG(dep_delay), 2) AS Average_dep_delay
FROM flights;

-- 8
SELECT COUNT(*) AS flights_from_JFK
FROM flights
WHERE origin = 'JFK';

-- 9 
SELECT DISTINCT dest
FROM flights;

SELECT COUNT(DISTINCT dest) AS total 
FROM flights;

SELECT dest, COUNT(*) AS number_of_flight
FROM flights
GROUP BY dest;

-- 10
SELECT MAX(arr_time) AS maximum_air_time
FROM flights;

-- 11
SELECT COUNT(*) AS flights_over_60min_delay
FROM flights
WHERE dep_delay > 60;

-- 12
SELECT *
FROM flights
WHERE carrier = 'UA';

-- 13
SELECT 
    MIN(distance) AS minimum_distance,
	MAX(distance) AS maximum_distance
FROM flights;

-- 14
SELECT COUNT(*) AS january_flights
FROM flights
WHERE month = 1;

-- 15
SELECT *
FROM planes;

SELECT COUNT(tailnum) AS tailnum_more_than_1
FROM planes
GROUP BY tailnum
HAVING COUNT(tailnum) > 1;

-- 16
SELECT SUM(seats) AS total_number_of_seat
FROM planes;

-- 17
SELECT *
FROM weather;

SELECT *
FROM weather
WHERE wind_speed > 30;

-- 18
SELECT COUNT(*) as missing_arrival_time
FROM flights
WHERE arr_time is NULL;

-- 19
SELECT DISTINCT manufacturer
FROM planes;

-- 20
SELECT COUNT(*) AS on_time_departures
FROM flights
WHERE dep_delay <= 0;

-- 21
SELECT *
FROM planes
WHERE year < 2000;

-- 22
SELECT ROUND(AVG(temp)::NUMERIC, 2) AS average_temp
FROM weather;

-- 23
SELECT COUNT(DISTINCT tailnum) AS distinct_tailnum
FROM flights;

SELECT COUNT(DISTINCT tailnum) AS distinct_tailnum
FROM planes;

-- 24
SELECT origin, COUNT(*) AS flight_count
FROM flights
GROUP BY origin;

-- 25
SELECT *
FROM flights
WHERE dest = 'LAX';