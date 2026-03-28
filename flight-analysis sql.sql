CREATE TABLE airlines(
          carrier CHAR(2) CONSTRAINT carrier_key PRIMARY KEY,
		  name text 
);

SELECT *
FROM airlines;


CREATE TABLE airports(
          sn SMALLINT,
		  faa CHAR(3) CONSTRAINT faa_key PRIMARY KEY,
	      name TEXT,
	      lat NUMERIC(12, 8),
	      lon NUMERIC(12, 8),
	      alt REAL,
	      tz SMALLINT,
	      dst VARCHAR(4),
	      tzone VARCHAR(100)
);

SELECT *
FROM airports;

CREATE TABLE planes(
          sn SMALLINT,
	      tailnum TEXT,
	      year INT,
	      type VARCHAR(50),
	      manufacturer VARCHAR(50),
	      model VARCHAR(50),
	      engines CHAR(1),
	      seats SMALLINT,
	      speed SMALLINT,
	      engine VARCHAR(50) 
);

SELECT *
FROM planes;

CREATE TABLE weather(
          sn SMALLINT,
	      origin CHAR(3),
	      year INT,
	      month SMALLINT,
	      day INT,
	      hour INT,
	      temp REAL,
	      dewp REAL,
	      humid REAL,
	      wind_dir INT,
	      wind_speed NUMERIC(10, 7),
	      wind_gust NUMERIC(15, 12),
	      precip REAL,
	      pressure REAL,
	      visib REAL,
	      time_hour TIMESTAMP,

		  CONSTRAINT weather_key PRIMARY KEY(origin, year, month, day, hour),
		  FOREIGN KEY (origin) REFERENCES airports(faa)
);

SELECT *
FROM weather;

CREATE TABLE flights(
           sn INT,
	       year INT,
	       month SMALLINT,
	       day INT,
	       dep_time INT,
	       sched_dep_time INT,
	       dep_delay INT,
           arr_time INT,
	       sched_arr_time INT,
	       arr_delay INT,
	       carrier CHAR(2),
	       flight INT,
	       tailnum TEXT,
	       origin CHAR(3),
	       dest CHAR(3),
	       air_time INT,
	       distance INT,
	       hour INT,
	       minute INT,
	       time_hour TIMESTAMP,

	CONSTRAINT fk_airline
	       FOREIGN KEY(carrier) REFERENCES airlines(carrier),
	CONSTRAINT fk_origin
	       FOREIGN KEY(origin) REFERENCES airports(faa),
	CONSTRAINT fk_dest
	       FOREIGN KEY(dest) REFERENCES airports(faa),
	CONSTRAINT fk_weather
	       FOREIGN KEY(origin, year, month, day, hour)
		   REFERENCES weather(origin, year, month, day,hour)
);

COPY flights
FROM 'C:\Users\HomePC\Documents\SQL\flights-analysis\data\flights.csv'
WITH (FORMAT CSV, HEADER, NULL 'NA');

SELECT *
FROM flights;