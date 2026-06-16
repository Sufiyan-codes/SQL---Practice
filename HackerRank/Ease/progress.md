# SQL Learning Progress

## Course: SQL by Baraa (PostgreSQL)

### ✅ Intermediate Level - Completed
- JOINs (INNER, LEFT, RIGHT, FULL, Anti)
- Set Operators (UNION, UNION ALL, EXCEPT, INTERSECT)
- Aggregation & GROUP BY
- Window Functions (RANK, DENSE_RANK, ROW_NUMBER, PERCENT_RANK, Frame Clauses)

---

### 🚀 Advanced Level - In Progress
- SQL Functions (String, Number, Date, Conditional)

---

## HackerRank Practice Log

### 15 June 2025
- Solved Basic SELECT problems (10 questions)
- Topics: WHERE, DISTINCT, COUNT, UNION ALL, LENGTH()


### Query the list of CITY names starting with vowels (a, e, i, o, u) from STATION.
SELECT CITY
FROM STATION
WHERE CITY LIKE 'a%'
OR CITY LIKE 'e%'
OR CITY LIKE 'o%'
OR CITY LIKE 'i%'
OR CITY LIKE 'u%';


### Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a'
OR CITY LIKE '%e'
OR CITY LIKE '%o'
OR CITY LIKE '%i'
OR CITY LIKE '%u';

### Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%')
AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');

### Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'a%'
AND CITY NOT LIKE 'e%'
AND CITY NOT LIKE 'o%'
AND CITY NOT LIKE 'i%'
AND CITY NOT LIKE 'u%';

### Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%a'
AND CITY NOT LIKE '%e'
AND CITY NOT LIKE '%o'
AND CITY NOT LIKE '%i'
AND CITY NOT LIKE '%u';







### 16 June 2025
- Solved Basic SELECT problems (10 questions)


### Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%')
OR 
(CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u');


### Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%')
AND 
(CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u');


### Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT NAME
FROM STUDENTS
WHERE MARKS >75
ORDER BY RIGHT(NAME,3), ID


### Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME 


### Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID