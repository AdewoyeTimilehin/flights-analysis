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

-- 26
SELECT
	fl.year,
	fl.carrier,
	al.name,
	ROUND(AVG(fl.dep_delay), 2) AS average_dep_delay
FROM flights AS fl JOIN airlines AS al
ON fl.carrier = al.carrier
GROUP BY fl.year, fl.carrier, al.name
ORDER BY average_dep_delay DESC
LIMIT 1;

-- 27

SELECT *
FROM airports;

SELECT
	fl.origin,
	ar.name AS destination,
	COUNT (*) AS number_of_flights
FROM flights AS fl JOIN airports AS ar
ON fl.dest = ar.faa
GROUP BY fl.origin, ar.name
ORDER BY number_of_flights DESC
LIMIT 10;

-- 28
-- For each month, calculate the average arrival delay across all flights.

CREATE TABLE month_label (
	month SMALLINT,
	name TEXT
);

INSERT INTO month_label
VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August'),
	(9, 'September'),
	(10, 'October'),
	(11, 'November'),
	(12, 'December');

SELECT
	mn.name,
	ROUND(AVG(arr_delay), 2) AS average_arrival_delay
FROM flights AS fl JOIN month_label AS mn
USING (month)
GROUP BY mn.name, fl.month
ORDER BY fl.month;

-- 29

SELECT *
FROM flights
WHERE dep_delay > arr_delay^2

SELECT COUNT(*)
FROM flights
WHERE dep_delay > arr_delay^2

-- 30
-- Which destination airport received the most flights from EWR?

SELECT
	ar.name,
	count(fl.dest) AS num_of_flights
FROM flights AS fl JOIN airports AS ar
ON fl.dest = ar.faa
WHERE fl.origin = 'EWR'
GROUP BY ar.name, fl.dest
ORDER BY num_of_flights DESC
LIMIT 1;

SELECT *
FROM flights;

SELECT *
FROM airlines;

-- 31
SELECT
     name,
     fl.carrier,
	 COUNT(*) AS total_flight,
	 ROUND(AVG(air_time), 2) AS avg_air_time
FROM flights AS fl JOIN airlines AS al
ON fl.carrier = al.carrier
GROUP BY fl.carrier, name
ORDER BY avg_air_time DESC;

-- 32
SELECT
     tailnum,
	 COUNT(*) AS total_flights
FROM flights
GROUP BY tailnum
HAVING COUNT(*) > 200
ORDER BY total_flights DESC;

-- 33
SELECT 
     f.carrier, 
	 a.name AS airline_name
FROM flights AS f
JOIN airlines AS a
ON f.carrier = a.carrier;

-- 34





-- 35





- 36
SELECT p.manufacturer,
       ROUND(AVG(f.arr_delay)::numeric, 2) AS avg_arrival_delay
FROM flights AS f
JOIN planes AS p
ON f.tailnum = p.tailnum

-- 37
SELECT *
FROM flights
WHERE dep_time BETWEEN 600 AND 900;

-- 38
SELECT 
    *
FROM planes
ORDER BY seats DESC
LIMIT 5;

-- 39 
SELECT 
    f.origin,
    AVG(f.dep_delay) AS avg_dep_delay
FROM flights AS f
JOIN weather AS w
    ON f.year = w.year
    AND f.month = w.month
    AND f.day = w.day
    AND f.origin = w.origin
WHERE w.precip > 0
GROUP BY f.origin
ORDER BY avg_dep_delay DESC;

-- 40
SELECT 
    CAST(sched_dep_time / 100 AS INT) AS dep_hour,
    COUNT(*) AS num_departures
FROM flights
GROUP BY dep_hour
ORDER BY dep_hour;

-- 41




-- 42
SELECT 
    f.carrier,
    a.name AS airline_name,
    ROUND(AVG(f.distance), 2) AS avg_distance
FROM flights AS f
JOIN airlines AS a
    ON f.carrier = a.carrier
GROUP BY f.carrier, a.name
ORDER BY avg_distance DESC
LIMIT 1;

-- 43
SELECT 
    f.carrier,
    a.name AS airline_name,
    COUNT(*) AS num_cancelled
FROM flights AS f
JOIN airlines AS a
    ON f.carrier = a.carrier
WHERE f.arr_time IS NULL 
AND f.dep_time IS NOT NULL
GROUP BY f.carrier, a.name
ORDER BY num_cancelled DESC;

-- 44





-- 45







-- 46






-- 47 
SELECT 
    CAST(sched_dep_time / 100 AS INT) AS dep_hour,
    COUNT(*) AS num_departures
FROM flights
WHERE origin = 'JFK'
GROUP BY dep_hour
ORDER BY num_departures DESC
LIMIT 10;

-- 48





-- 49






-- 50
SELECT *
FROM flights
WHERE arr_delay > dep_delay;




