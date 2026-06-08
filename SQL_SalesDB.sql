-- =============================================================
-- PostgreSQL Database Creation and Table Setup Script
-- =============================================================
-- WARNING:
-- This script assumes you are manually connected to the 'postgres' database
-- and have the privileges to drop/create databases and schemas.
-- It drops the 'salesdb' database if it exists.

-- DROP AND CREATE DATABASE
-- DROP DATABASE IF EXISTS salesdb;
-- CREATE DATABASE salesdb;

-- Connect to the new database (manual step in most PostgreSQL tools)

-- Now switch to the salesdb database to execute the following

-- Create schema
DROP SCHEMA IF EXISTS sales CASCADE;
CREATE SCHEMA sales;

-- ======================================================
-- Table: customers
-- ======================================================

CREATE TABLE sales.customers (
    customerid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    country VARCHAR(50),
    score INT
);

INSERT INTO sales.customers VALUES
    (1, 'Jossef', 'Goldberg', 'Germany', 350),
    (2, 'Kevin', 'Brown', 'USA', 900),
    (3, 'Mary', NULL, 'USA', 750),
    (4, 'Mark', 'Schwarz', 'Germany', 500),
    (5, 'Anna', 'Adams', 'USA', NULL);

-- ======================================================
-- Table: employees
-- ======================================================

CREATE TABLE sales.employees (
    employeeid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    department VARCHAR(50),
    birthdate DATE,
    gender CHAR(1),
    salary INT,
    managerid INT
);

INSERT INTO sales.employees VALUES
    (1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
    (2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
    (3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
    (4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
    (5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);

-- ======================================================
-- Table: products
-- ======================================================

CREATE TABLE sales.products (
    productid INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    price INT
);

INSERT INTO sales.products VALUES
    (101, 'Bottle', 'Accessories', 10),
    (102, 'Tire', 'Accessories', 15),
    (103, 'Socks', 'Clothing', 20),
    (104, 'Caps', 'Clothing', 25),
    (105, 'Gloves', 'Clothing', 30);

-- ======================================================
-- Table: orders
-- ======================================================

CREATE TABLE sales.orders (
    orderid INT PRIMARY KEY,
    productid INT,
    customerid INT,
    salespersonid INT,
    orderdate DATE,
    shipdate DATE,
    orderstatus VARCHAR(50),
    shipaddress VARCHAR(255),
    billaddress VARCHAR(255),
    quantity INT,
    sales INT,
    creationtime TIMESTAMP
);

INSERT INTO sales.orders VALUES
    (1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered', '9833 Mt. Dias Blv.', '1226 Shoe St.', 1, 10, '2025-01-01 12:34:56'),
    (2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped', '250 Race Court', NULL, 1, 15, '2025-01-05 23:22:04'),
    (3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '2025-01-10 18:24:08'),
    (4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', '', 2, 60, '2025-01-20 05:50:33'),
    (5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered', NULL, NULL, 1, 25, '2025-02-01 14:02:41'),
    (6, 104, 3, 5, '2025-02-05', '2025-02-10', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '2025-02-06 15:34:57'),
    (7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered', '136 Balboa Court', '', 2, 30, '2025-02-16 06:22:01'),
    (8, 101, 4, 3, '2025-02-18', '2025-02-27', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '2025-02-18 10:45:22'),
    (9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped', '3768 Door Way', '', 2, 20, '2025-03-10 12:59:04'),
    (10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped', NULL, NULL, 0, 60, '2025-03-16 23:25:15');

-- ======================================================
-- Table: orders_archive
-- ======================================================

CREATE TABLE sales.ordersarchive (
    orderid INT,
    productid INT,
    customerid INT,
    salespersonid INT,
    orderdate DATE,
    shipdate DATE,
    orderstatus VARCHAR(50),
    shipaddress VARCHAR(255),
    billaddress VARCHAR(255),
    quantity INT,
    sales INT,
    creationtime TIMESTAMP
);

INSERT INTO sales.ordersarchive VALUES
    (1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56'),
    (2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04'),
    (3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08'),
    (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', '', 2, 60, '2024-04-20 05:50:33'),
    (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', '', 2, 60, '2024-04-20 14:50:33'),
    (5, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41'),
    (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57'),
    (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05'),
    (6, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55'),
    (7, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15');

--============================================================================================================================

------  Day 4 :- JOINS AND SET OPERATORS  ------

--1) FULL JOIN :- Get all customeres & all orders even if there's no match
SELECT 
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.customers as c 
FULL JOIN sales.orders as o
	ON c.customerid = o.customerid;


--2) INNER JOIN :- Get all customeres & all orders even if there's no match
SELECT 
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.customers as c 
INNER JOIN sales.orders as o
	ON c.customerid = o.customerid;


--3) LEFT JOIN :- Get all customeres along with orders including those without orders.
SELECT
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.customers as c 
LEFT JOIN sales.orders as o
	ON c.customerid = o.customerid;

--4) RIGHT JOIN :- Get all customeres along with orders including orders without matching customers.
SELECT
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.orders as o
RIGHT JOIN sales.customers as c 
	ON c.customerid = o.customerid;

--5) LEFT ANTI-JOIN :- Get all customers who haven't placed any orders.
SELECT
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.customers as c
LEFT JOIN sales.orders as o
	ON c.customerid = o.customerid
WHERE o.customerid IS NULL;

--6) RIGHT ANTI-JOIN :- Get all orders without matching customers.
SELECT
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.customers as c
RIGHT JOIN sales.orders as o 
	ON o.customerid = c.customerid
WHERE c.customerid IS NULL;

--7) FULL ANTI-JOIN :- Get all customers without orders and orders withoud customers.
SELECT
	c.customerid, 
	c.firstname, 
	c.lastname, 
	o.sales, 
	o.orderdate
FROM sales.customers as c
FULL JOIN sales.orders as o
	ON c.customerid = o.customerid
WHERE o.customerid IS NULL OR c.customerid IS NULL;

--8) CROSS JOIN :- Generate all possible combinations of customers and orders
SELECT *
FROM sales.customers
CROSS JOIN 
sales.orders;

---- SET OPERATORS ----

--1) UNION :- Returns all distinct rows from both queries
SELECT 
	c.firstname,
	c.lastname
FROM sales.customers AS c
UNION
SELECT
	e.firstname,
	e.lastname
FROM sales.employees AS e;

--2) UNION ALL :- Returns all  rows from both queries including duplicates
SELECT 
	c.firstname,
	c.lastname
FROM sales.customers AS c
UNION ALL
SELECT
	e.firstname,
	e.lastname
FROM sales.employees AS e;

--3) EXCEPT :- Returns all distinct rows from the first query (same as LEFT & RIGHT join)
SELECT 
	c.firstname,
	c.lastname
FROM sales.customers AS c
EXCEPT
SELECT
	e.firstname,
	e.lastname
FROM sales.employees AS e;

--4) INTERSECT :- Returns only rows that are common in both queries (same as INNER join)
SELECT 
	c.firstname,
	c.lastname
FROM sales.customers AS c
INTERSECT
SELECT
	e.firstname,
	e.lastname
FROM sales.employees AS e;

--=====================================================================================================



---------------------------------  Day 5 :- SQL FUNCTION  ----------------------------------------------

----  STRING FUNCTIONS  ----

--1) CONCAT :- Combines multiple string into one 
SELECT firstname, country,
CONCAT(firstname,' ',country) AS CONCAT_STRING
FROM sales.customers;

--2) UPPER :- Convert all characters to 'UPPERCASE'
SELECT firstname, country,
UPPER(firstname) AS Upper_Case
FROM sales.customers;

--3) LOWER :- Convert all characters to 'LOWERCASE'
SELECT firstname, country,
LOWER(firstname) AS Lower_Case
FROM sales.customers;

--4) TRIM :- Removes leading & trailing spaces
SELECT firstname,
LENGTH(firstname) AS len_string
FROM sales.customers;

SELECT firstname
FROM sales.customers
WHERE firstname != TRIM(firstname);  -- This is used to check if there is a empty space or not in a string

--5) REPLACE :- Replace specific characters with a new characters
SELECT
REPLACE('report.txt', '.txt' ,'.csv');

SELECT firstname,
REPLACE(firstname, 'M', 'N')
FROM sales.customers;

--6) LENGTH :- Counts the number of characters
SELECT
LENGTH('SUFIYAN');

SELECT firstname,
LENGTH(firstname) AS STR_LEN
FROM sales.customers;

--7) LEFT :- Extract specific no of characters from th start
SELECT 
LEFT('SUFIYAN',4); -- SUFI

SELECT firstname,
LEFT(firstname, 3)
FROM sales.customers;

--8) RIGHT :- Extract specific no of characters from th end
SELECT 
RIGHT('SUFIYAN',4); -- IYAN

SELECT firstname,
RIGHT(firstname, 3)
FROM sales.customers;

--9) SUBSTRING :- Extracts a part of string at a specific position
SELECT
SUBSTRING('SUFIYAN',3,2); -- FI, 3 is the starting point and 2 is how much characters we want

-- USE OF SUBSTRING DYNAMICALLY
SELECT firstname,
SUBSTRING(TRIM(firstname), 2, LENGTH(firstname)) -- return names from 2 position to end position without counting empty spaces
FROM sales.customers;

--=================================================================================================

----  NUMERIC FUNCTIONS  ----

--1) ROUND :- Rounds up the numeric values
/*
	Note :- 1) FOR 2 LOGIC -> checks dights, 2 means '51' then checks 1 > 6 
			   no then round up the greater value 
            2) FOR 1 LOGIC -> checks dights, 1 means we want 1 digits after 
			   decimal '51' then checks 5 > 1 yes, then round up the greater value
			3) FOR 0 LOGIC -> checks dights, 0 means we want 0 digits after decimal.
*/
SELECT 3.516, 
ROUND(3.516,2); 
SELECT 3.516, 
ROUND(3.516,1);
SELECT 3.516, 
ROUND(3.516,0); 

--2) ABS :- Returns the absolute (positive) value of a number removing any negatice sign.

SELECT -10,
ABS(-10);  -- 10

SELECT 10
ABS(10);  -- ALSO 10

--===============================================================================================

----  DATE & TIME FUNCTIONS  ----


-- =====================================================
-- QUICK CHEATSHEET
-- =====================================================
-- CURRENT_DATE          → today's date
-- CURRENT_TIME          → current time
-- NOW()                 → date + time
-- EXTRACT(part FROM d)  → get one part of a date
-- DATE_TRUNC('unit', d) → round down to unit
-- date + INTERVAL '...' → add time to a date
-- d2 - d1               → days between two dates
-- AGE(d2, d1)           → human-readable difference
-- TO_CHAR(d, 'format')  → format date as text
-- TO_DATE(text, 'fmt')  → convert text to date
-- MAKE_DATE(y, m, d)    → build date from numbers
-- =====================================================

-- ----------------------------------------------------
-- 1. CURRENT DATE & TIME
-- ----------------------------------------------------

SELECT CURRENT_DATE;
-- Returns today's date only (no time)

SELECT CURRENT_TIME;
-- Returns current time only (no date)

SELECT NOW();
-- Returns current date + time with timezone

SELECT CURRENT_TIMESTAMP;
-- Same as NOW(), returns date + time with timezone

SELECT LOCALTIME;
-- Returns current time without timezone

SELECT LOCALTIMESTAMP;
-- Returns current date + time without timezone


-- ----------------------------------------------------
-- 2. EXTRACT A PART FROM DATE
-- ----------------------------------------------------

SELECT EXTRACT(year   FROM CURRENT_DATE);
-- Extracts the year (e.g. 2026)

SELECT EXTRACT(month  FROM CURRENT_DATE);
-- Extracts the month number (e.g. 6)

SELECT EXTRACT(day    FROM CURRENT_DATE);
-- Extracts the day number (e.g. 8)

SELECT EXTRACT(hour   FROM NOW());
-- Extracts the hour from a timestamp

SELECT EXTRACT(minute FROM NOW());
-- Extracts the minute from a timestamp

SELECT EXTRACT(second FROM NOW());
-- Extracts the second from a timestamp

SELECT EXTRACT(week   FROM CURRENT_DATE);
-- Extracts the ISO week number of the year

SELECT EXTRACT(quarter FROM CURRENT_DATE);
-- Extracts the quarter (1, 2, 3, or 4)

SELECT EXTRACT(dow    FROM CURRENT_DATE);
-- Extracts day of week (0=Sunday, 6=Saturday)

SELECT EXTRACT(doy    FROM CURRENT_DATE);
-- Extracts day of the year (1 to 365/366)

SELECT EXTRACT(epoch  FROM NOW());
-- Returns seconds since 1970-01-01 (Unix timestamp)


-- ----------------------------------------------------
-- 3. DATE_PART (SAME AS EXTRACT, OLDER SYNTAX)
-- ----------------------------------------------------

SELECT DATE_PART('year',  CURRENT_DATE);
-- Same as EXTRACT(year FROM ...), just different syntax

SELECT DATE_PART('month', CURRENT_DATE);
-- Same as EXTRACT(month FROM ...)

SELECT DATE_PART('day',   CURRENT_DATE);
-- Same as EXTRACT(day FROM ...)


-- ----------------------------------------------------
-- 4. DATE_TRUNC (TRUNCATE TO A UNIT)
-- ----------------------------------------------------

SELECT DATE_TRUNC('year',    CURRENT_DATE);
-- Truncates to start of year → 2026-01-01

SELECT DATE_TRUNC('month',   CURRENT_DATE);
-- Truncates to start of month → 2026-06-01

SELECT DATE_TRUNC('week',    CURRENT_DATE);
-- Truncates to start of week (Monday)

SELECT DATE_TRUNC('day',     NOW());
-- Removes time part, keeps date only

SELECT DATE_TRUNC('hour',    NOW());
-- Truncates to the current hour, zeroes minutes/seconds

SELECT DATE_TRUNC('quarter', CURRENT_DATE);
-- Truncates to start of the current quarter


-- ----------------------------------------------------
-- 5. ADD / SUBTRACT DATES (INTERVAL)
-- ----------------------------------------------------

SELECT CURRENT_DATE + INTERVAL '10 days';
-- Adds 10 days to today

SELECT CURRENT_DATE - INTERVAL '1 month';
-- Subtracts 1 month from today

SELECT CURRENT_DATE + INTERVAL '2 years';
-- Adds 2 years to today

SELECT NOW() + INTERVAL '3 hours';
-- Adds 3 hours to current timestamp

SELECT NOW() - INTERVAL '30 minutes';
-- Subtracts 30 minutes from current timestamp

SELECT NOW() + INTERVAL '1 year 2 months 10 days';
-- You can combine multiple units in one INTERVAL


-- ----------------------------------------------------
-- 6. DATEDIFF EQUIVALENT (SUBTRACT TWO DATES)
-- ----------------------------------------------------

SELECT '2026-12-31'::DATE - '2026-06-08'::DATE;
-- Returns number of days between two dates (as integer)

SELECT AGE('2026-12-31', '2026-06-08');
-- Returns difference as readable interval (e.g. '6 mons 23 days')

SELECT AGE(CURRENT_DATE, '2000-01-01');
-- Calculates age from a birthdate to today


-- ----------------------------------------------------
-- 7. FORMATTING DATES (TO_CHAR)
-- ----------------------------------------------------

SELECT TO_CHAR(CURRENT_DATE, 'DD-MM-YYYY');
-- Formats date as 08-06-2026

SELECT TO_CHAR(CURRENT_DATE, 'Month DD, YYYY');
-- Formats date as June 08, 2026

SELECT TO_CHAR(CURRENT_DATE, 'Day');
-- Returns full day name (e.g. Monday)

SELECT TO_CHAR(CURRENT_DATE, 'Mon');
-- Returns short month name (e.g. Jun)

SELECT TO_CHAR(CURRENT_DATE, 'MM/DD/YYYY');
-- Formats date as 06/08/2026

SELECT TO_CHAR(NOW(), 'DD-MM-YYYY HH24:MI:SS');
-- Formats full timestamp with 24hr time


-- ----------------------------------------------------
-- 8. CONVERTING TEXT TO DATE (TO_DATE)
-- ----------------------------------------------------

SELECT TO_DATE('08-06-2026', 'DD-MM-YYYY');
-- Converts a text string into a proper DATE value

SELECT TO_DATE('June 08 2026', 'Month DD YYYY');
-- Converts written date text into a DATE value


-- ----------------------------------------------------
-- 9. EOMONTH EQUIVALENT (LAST DAY OF MONTH)
-- ----------------------------------------------------

SELECT DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' - INTERVAL '1 day';
-- Returns the last day of the current month


-- ----------------------------------------------------
-- 10. MAKE A DATE FROM PARTS
-- ----------------------------------------------------

SELECT MAKE_DATE(2026, 6, 8);
-- Builds a DATE from year, month, day integers

SELECT MAKE_TIMESTAMP(2026, 6, 8, 14, 30, 0);
-- Builds a TIMESTAMP from year, month, day, hour, min, sec


-- ----------------------------------------------------
-- 11. TIMEZONE FUNCTIONS
-- ----------------------------------------------------

SELECT NOW() AT TIME ZONE 'Asia/Kolkata';
-- Converts current time to IST (your timezone)

SELECT TIMEZONE('Asia/Kolkata', NOW());
-- Same as above, alternate syntax

--====================================================================================================

---- FORMAT & CASTING  ----

--1) FORMAT :- Formats a STRING 
-- Used for building formatted strings (like printf)
SELECT FORMAT('Hello %s, you are %s years old', 'Sufiyan', 21);
-- Output: Hello Sufiyan, you are 21 years old

SELECT FORMAT('Order ID: %s | Date: %s', 101, CURRENT_DATE);
-- Output: Order ID: 101 | Date: 2026-06-08


--2) CAST :- Converts one form of data_type to any other 

-- Convert text to integer
SELECT CAST('123' AS INTEGER);

-- Convert integer to text
SELECT CAST(123 AS TEXT);

-- Convert text to date
SELECT CAST('2026-06-08' AS DATE);

-- Convert text to decimal
SELECT CAST('99.99' AS DECIMAL);

-- Convert integer to float
SELECT CAST(5 AS FLOAT);

--====================================================================================================


































