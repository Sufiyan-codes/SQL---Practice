-- ============================================
-- HackerRank SQL Practice
-- Topic   : Basic SELECT
-- Dialect : MySQL (HackerRank default)
-- ============================================


-- #1 | Easy | Revising the Select Query I
-- Query all columns for all American cities with population > 100000.
SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;


-- #2 | Easy | Revising the Select Query II
-- Query the NAME of all American cities with population > 120000.
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';


-- #3 | Easy | Select All
-- Query all columns for every row in the CITY table.
SELECT *
FROM CITY;


-- #4 | Easy | Select By ID
-- Query all columns for the city with ID = 1661.
SELECT *
FROM CITY
WHERE ID = 1661;


-- #5 | Easy | Japanese Cities' Attributes
-- Query all attributes of every Japanese city (COUNTRYCODE = 'JPN').
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';


-- #6 | Easy | Japanese Cities' Names
-- Query the names of all Japanese cities (COUNTRYCODE = 'JPN').
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';


-- #7 | Easy | Weather Observation Station 1
-- Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;


-- #8 | Easy | Weather Observation Station 3
-- Query CITY names with an even ID number, excluding duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;


-- #9 | Easy | Weather Observation Station 4
-- Find the difference between total CITY entries and distinct CITY entries.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;


-- #10 | Easy | Weather Observation Station 5
-- Query the shortest and longest CITY names and their lengths.
-- If tie, pick alphabetically first.
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1)
UNION ALL
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY ASC
LIMIT 1);
