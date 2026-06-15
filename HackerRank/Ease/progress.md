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

### Tonight (Post Isha)
- [ ] 2-3 HackerRank problems

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