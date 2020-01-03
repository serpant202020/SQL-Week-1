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

--5. Show all of the airlines, ordered by number of flights in descending order.
SELECT airlines.name, COUNT(flights.flight)
FROM flights 
INNER JOIN airlines ON flights.carrier = airlines.carrier 
GROUP BY airlines.carrier 
ORDER BY COUNT(flights.flight) DESC;

/*
*************************** 1. row ***************************
                 name: United Air Lines Inc.
count(flights.flight): 58665
*************************** 2. row ***************************
                 name: JetBlue Airways
count(flights.flight): 54635
*************************** 3. row ***************************
                 name: ExpressJet Airlines Inc.
count(flights.flight): 54173
*************************** 4. row ***************************
                 name: Delta Air Lines Inc.
count(flights.flight): 48110
*************************** 5. row ***************************
                 name: American Airlines Inc.
count(flights.flight): 32729
*************************** 6. row ***************************
                 name: Envoy Air
count(flights.flight): 26397
*************************** 7. row ***************************
                 name: US Airways Inc.
count(flights.flight): 20536
*************************** 8. row ***************************
                 name: Endeavor Air Inc.
count(flights.flight): 18460
*************************** 9. row ***************************
                 name: Southwest Airlines Co.
count(flights.flight): 12275
*************************** 10. row ***************************
                 name: Virgin America
count(flights.flight): 5162
*************************** 11. row ***************************
                 name: AirTran Airways Corporation
count(flights.flight): 3260
*************************** 12. row ***************************
                 name: Alaska Airlines Inc.
count(flights.flight): 714
*************************** 13. row ***************************
                 name: Frontier Airlines Inc.
count(flights.flight): 685
*************************** 14. row ***************************
                 name: Mesa Airlines Inc.
count(flights.flight): 601
*************************** 15. row ***************************
                 name: Hawaiian Airlines Inc.
count(flights.flight): 342
*************************** 16. row ***************************
                 name: SkyWest Airlines Inc.
count(flights.flight): 32

*/

--6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT airlines.name, COUNT(flights.flight)
FROM flights 
INNER JOIN airlines ON flights.carrier = airlines.carrier 
GROUP BY airlines.carrier 
ORDER BY COUNT(flights.flight) DESC
LIMIT 5;

/*
*************************** 1. row ***************************
                 name: United Air Lines Inc.
COUNT(flights.flight): 58665
*************************** 2. row ***************************
                 name: JetBlue Airways
COUNT(flights.flight): 54635
*************************** 3. row ***************************
                 name: ExpressJet Airlines Inc.
COUNT(flights.flight): 54173
*************************** 4. row ***************************
                 name: Delta Air Lines Inc.
COUNT(flights.flight): 48110
*************************** 5. row ***************************
                 name: American Airlines Inc.
COUNT(flights.flight): 32729

*/