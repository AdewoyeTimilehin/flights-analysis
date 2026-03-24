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

1. List all unique carrier codes from the flights table.
2. How many flights are recorded in the flights table?
3. What are all the origin airports that appear in the flights table?
4. Display the first 10 rows from the flights table.
5. List the names of all airlines in the airlines table.
6. How many airports are listed in the airports table?
7. What is the average departure delay (`dep_delay`) across all flights?
8. How many flights departed from JFK airport?
9. List all distinct destination airports (`dest`) in the flights table.
10. What is the maximum air time recorded in the flights table?
11. How many flights had a departure delay greater than 60 minutes?
12. List all flights operated by carrier 'UA'.
13. What is the minimum and maximum distance flown by any flight?
14. How many flights departed in the month of January?
15. Which tail numbers appear more than once in the planes table?
16. What is the total number of seats across all planes?
17. List all weather records where wind_speed exceeded 30 mph.
18. How many flights have a missing (`NULL`) arrival time?
19. What are the distinct aircraft manufacturers in the planes table?
20. How many flights departed on time (`dep_delay <= 0`)?
21. List all planes manufactured before the year 2000.
22. What is the average temperature (`temp`) in the weather table?
23. How many distinct tail numbers are in the flights table?
24. Count flights grouped by origin airport.
25. List all flights where destination is 'LAX'.

---

# Section 2 — Medium

26. Which carrier had the highest average departure delay in 2023?
27. List the top 10 most frequently flown routes (origin-destination pairs).
28. For each month, calculate the average arrival delay.
29. Find flights where departure delay is more than twice arrival delay.
30. Which destination received the most flights from EWR?
31. For each carrier, count total flights and average air time.
32. List planes that flew more than 200 flights in the year.
33. Join flights with airlines to show airline names.
34. Calculate percentage of early arrivals (`arr_delay < 0`) per carrier.
35. For each origin, find the month with highest average departure delay.
36. Which manufacturer has the lowest average arrival delay?
37. Find flights departing between 6:00 AM and 9:00 AM.
38. Top 5 aircraft models with the most seats.
39. Join flights with weather where precipitation = 0.
40. Count scheduled departures per hour.
41. Routes where air time differs from scheduled by >30 minutes.
42. Which carrier operated the longest average distance flights?
43. Count cancelled flights per carrier (`arr_time IS NULL`).
44. Airports appearing only as destinations, not origins.
45. Average departure delay by day of week.
46. Tail numbers used across more than 3 routes.
47. Top 10 busiest hours at JFK.
48. On-time departure rate (`dep_delay <= 15`) per carrier.
49. Average wind speed on high-delay days (top 10%).
50. Flights where `arr_delay > dep_delay`.

---

# Section 3 — Difficult

51. Rank carriers by total flights per origin airport.
52. 7-day rolling average of departure delay for JFK.
53. Identify hub-spoke routes and compare delays.
54. Find carriers with improved on-time arrival from Q1 to Q4.
55. Tail numbers with both severe delay (>120) and on-time flights same day.
56. Pivot monthly average departure delay per carrier.
57. Build flight connections within 2 hops from LGA.
58. Compute Haversine distance to JFK and find closest airports.
59. Weather conditions most correlated with delays >30 minutes.
60. Detect short layovers (<45 mins) using window functions.
61. Coefficient of variation of departure delay per carrier.
62. Identify “ghost flights” (both dep_time and arr_time NULL).
63. Minimum-delay path between two cities (graph-like query).
64. Plane models with worst delay relative to manufacturer average.
65. Routes with high variability (std dev > 30 mins).
66. Build a carrier performance scorecard.
67. Detect delay cascades using LAG/LEAD.
68. Airports with worse winter delays (Nov–Feb).
