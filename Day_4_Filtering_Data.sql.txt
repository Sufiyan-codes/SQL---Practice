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
