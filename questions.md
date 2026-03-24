# nycflights23 SQL Question Bank

**75 Practice Questions — Easy · Medium · Difficult**

---

## Dataset Schema Reference

The `nycflights23` dataset contains five relational tables capturing commercial flight operations, aircraft details, airport metadata, and hourly weather observations for New York City airports in 2023.

### Tables

| Table     | Key Columns | Description |
|----------|------------|-------------|
| flights  | year, month, day, dep_time, arr_time, carrier, tailnum, flight, origin, dest, air_time, distance, dep_delay, arr_delay, sched_dep_time, sched_arr_time | One row per flight; core fact table |
| airlines | carrier, name | Carrier code to full airline name lookup |
| airports | faa, name, lat, lon, alt, tz, dst, tzone | Airport metadata including coordinates |
| planes   | tailnum, year, type, manufacturer, model, engines, seats, speed, engine | Aircraft registration and characteristics |
| weather  | origin, year, month, day, hour, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib, time_hour | Hourly weather at NYC origin airports |

---

# Section 1 — Easy

These questions require single-table queries, basic aggregations, simple filters, and straightforward SELECT statements. Suitable for learners new to SQL or the nycflights23 dataset.


| S/N  |   Questions  |
|------|---------------|  
|1.    |List all unique carrier codes from the flights table. |
|2.    | How many flights are recorded in the flights table?  |
|3.    | What are all the origin airports that appear in the flights table? |
|4.    | Display the first 10 rows from the flights table. |
|5.    | List the names of all airlines in the airlines table. |
|6.    | How many airports are listed in the airports table? |
|7.    | What is the average departure delay (`dep_delay`) across all flights? |
|8.    | How many flights departed from JFK airport? |
|9.    | List all distinct destination airports (`dest`) in the flights table. |
|10.   | What is the maximum air time recorded in the flights table? |
|11.   | How many flights had a departure delay greater than 60 minutes? |
|12.   | List all flights operated by carrier 'UA'. |
|13.   | What is the minimum and maximum distance flown by any flight? |
|14.   | How many flights departed in the month of January? |
|15.   | Which tail numbers appear more than once in the planes table? |
|16.   | What is the total number of seats across all planes? |
|17.   | List all weather records where wind_speed exceeded 30 mph. |
|18.   | How many flights have a missing (`NULL`) arrival time? |
|19.   | What are the distinct aircraft manufacturers in the planes table? |
|20.   | How many flights departed on time (`dep_delay <= 0`)? |
|21.   | List all planes manufactured before the year 2000. |
|22.   | What is the average temperature (`temp`) in the weather table? |
|23.   | How many distinct tail numbers are in the flights table? |
|24.   | Count flights grouped by origin airport. |
|25.   | List all flights where destination is 'LAX'. |

---

# Section 2 — Medium

These questions require multi-table JOINs, GROUP BY with HAVING, subqueries, date/time manipulation, and intermediate aggregations. Suitable for learners with foundational SQL knowledge.


| S/N  |   Questions  |
|------|---------------|  
|26.   | Which carrier had the highest average departure delay in 2023? |
|27.   | List the top 10 most frequently flown routes (origin–destination pairs) by number of flights. |
|28.   | For each month, calculate the average arrival delay across all flights. |
|29.   | Find all flights where the departure delay was more than twice the arrival delay. |
|30.   | Which destination airport received the most flights from EWR? |
|31.   | For each carrier, count the total number of flights and average air time. |
|32.   | List all planes (with tail number) that flew more than 200 flights in the year. |
|33.   | Join flights with airlines to display the full airline name alongside each flight's carrier code. |
|34.   | Calculate the percentage of flights that arrived early (arr_delay < 0) per carrier. |
|35.   | For each origin airport, find the month with the highest average departure delay. |
|36.   | Which aircraft manufacturer's planes had the lowest average arrival delay? |
|37.   | Find all flights that departed between 6:00 AM and 9:00 AM (dep_time between 600 and 900). |
|38.   | List the top 5 aircraft models (from planes) with the most seats. |
|39.   | Join flights with weather to find average dep_delay on days with precipitation > 0. |
|40.   | For each hour of the day, count the number of scheduled departures. |
|41.   | Find routes where the average air time differs by more than 30 minutes from the scheduled air time. |
|42.   | Which carrier operated the longest average distance flight? |
|43.   | How many flights were cancelled (arr_time IS NULL and dep_time IS NOT NULL) per carrier? |
|44.   | List all airports (from airports table) that appear as a destination but not as an origin in flights. |
|45.   | For each day of the week, calculate the average departure delay (use dow or date functions). |
|46.   | Which tail numbers were used across more than 3 different routes? |
|47.   | Find the top 10 busiest hours at JFK based on scheduled departure count. |
|48.   | Calculate the on-time departure rate (dep_delay <= 15) for each carrier. |
|49.   | Find the average wind speed on days with the highest departure delays (top 10% delay days) |
|50.   | Identify all flights where arr_delay > dep_delay (flight made up time in the air). |

---

# Section 3 — Difficult

These questions require window functions (ROW_NUMBER, RANK, LAG/LEAD, rolling aggregates), CTEs, self-joins, geospatial calculations, pivoting, and analytical reasoning across multiple tables. Suitable for advanced SQL practitioners.


| S/N  |   Questions  |
|------|---------------| 
|51.   | Using a window function, rank carriers by total flights per origin airport (rank within each origin). |
|52.   | Calculate a 7-day rolling average of departure delay for JFK, ordered by date. |
|53.   | For each route, identify whether it is a 'hub-spoke' route (one end is JFK, EWR, or LGA) and compute the average delay difference between hub-spoke and point-to-point routes. |
|54.   | Using a CTE, find carriers whose on-time arrival rate improved from Q1 to Q4 of 2023. |
|55.   | Identify tail numbers that had at least one flight with dep_delay > 120 min AND at least one with dep_delay <= 0 on the same day. |
|56.   | Write a query that pivots monthly average departure delay per carrier into columns (one column per month). |
|57.   | Using a recursive or iterative approach, build a flight connection list where a passenger can reach a destination within 2 hops from LGA. |
|58.   | For each airport in the airports table, compute the Haversine distance to JFK using lat/lon columns and identify the 10 closest destination airports by air distance. |
|59.   | Identify weather conditions (combinations of wind_speed, precip, visib) that are most correlated with departure delays exceeding 30 minutes. |
|60.   | Using window functions, detect flights on the same tail number where the layover time between consecutive flights was less than 45 minutes. |
|61.   | For each carrier, compute the coefficient of variation (std_dev / mean) of departure delay across all flights. |
|62.   | Identify 'ghost flights' — scheduled flights (in flights table) where both dep_time and arr_time are NULL — and group them by carrier and route. |
|63.   | Write a query to find the minimum-delay path between two cities using flights as edges, simulating a shortest-path approach in SQL. |
|64.   | Using subqueries or CTEs, find the plane model (from planes) that had the worst delay performance relative to its manufacturer's average. |
|65.   | For each origin-destination pair, calculate the standard deviation of air_time and flag routes with high variability (std_dev > 30 minutes). |
|66.   | Build a carrier performance scorecard: combine on-time rate, cancellation rate, average delay, and route coverage into a single ranked output. |
|67.   | Using LAG/LEAD window functions, identify departure delay 'cascades' — sequences of 3+ consecutive flights from the same origin with increasing dep_delay. |
|68.   | Find airports where arrival delays are significantly worse in winter months (Nov–Feb) vs. summer months (Jun–Aug) using conditional aggregation. |
|69.   | Compute the 90th percentile of departure delay for each carrier using a percentile function or approximation. |
|70.   | Join flights to weather by origin, year, month, day, and hour; then build a regression-ready table showing dep_delay alongside all weather features. |
|71.   | Identify the subset of planes (tail numbers) that account for 80% of total flight delays (a Pareto analysis). |
|72.   | Using a self-join on flights, find all pairs of flights that share the same tail number, depart from different origins, and arrive at the same destination on the same day. |
|73.   | Compute daily seat utilization proxies: total seats (from planes) divided by number of flights per route per day, and identify under- and over-utilized routes. |
|74.   | Using CASE WHEN and multiple aggregations, build a delay classification report: % of flights in each bucket (on time, slight delay 1–15 min, moderate 16–45 min, severe 45+ min) per carrier. |
|75.   | Identify carriers and routes where the actual flight distance (from flights) significantly diverges (>10%) from the geodesic distance computed from airport lat/lon coordinates. |