/* 
The following is the Github assignment for Week 1 for Sung Lee 
*/

/*
1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.
3. Show the total number of flights.
4. Show the total number of flights by airline (carrier).
5. Show all of the airlines, ordered by number of flights in descending order.
6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.
*/


--1 
SELECT origin, dest, MAX(distance) FROM flights;
/*
The destination that is the furthest away is IAH (George Bush Intercontinental) from EWR (Newark Liberty International) with a distance of 4983
*/

--2
--The different number of engines in the planes table is 4: 1, 2, 3, 4
SELECT DISTINCT(engines) FROM planes ORDER BY engines;

--For each engine, the aircraft with the greatest number of seats per engine can be found with these statements. 

SELECT MAX(seats) FROM planes WHERE engines = 1;
--The max is 16 for engine 1

SELECT * FROM planes WHERE engines = 1 AND seats = 16 ORDER BY model;
--The Dehavilland Otter DHC-3


SELECT MAX(seats) FROM planes WHERE engines = 2;
--The max is 400 for engine 2

SELECT * FROM planes WHERE engines = 2 AND seats = 400 ORDER BY model;
--The Boeing 777-200, 777-222, 777-224, and 777-232


SELECT MAX(seats) FROM planes WHERE engines = 3;
--The max is 379 for engine 3

SELECT * FROM planes WHERE engines = 3 AND seats = 379 ORDER BY model;
--The Airbus A330-223

SELECT MAX(seats) FROM planes WHERE engines = 4;
--The max is 450 for engine 4

SELECT * FROM planes WHERE engines = 4 AND seats = 450 ORDER BY model;
--The Boeing 747-451


--3
SELECT COUNT(flight) FROM flights;
--The total number of flights based upon the flight number is 336776


--4: The total number of flights by carrier
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier;
/*
| carrier | count(*) |
+---------+----------+
| 9E      |    18460 |
| AA      |    32729 |
| AS      |      714 |
| B6      |    54635 |
| DL      |    48110 |
| EV      |    54173 |
| F9      |      685 |
| FL      |     3260 |
| HA      |      342 |
| MQ      |    26397 |
| OO      |       32 |
| UA      |    58665 |
| US      |    20536 |
| VX      |     5162 |
| WN      |    12275 |
| YV      |      601 |
*/
