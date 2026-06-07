-- Connect to the default database (if not already connected)

-- Drop the 'MyDatabase' database if it exists and then create it.
DROP DATABASE IF EXISTS "MyDatabase";
CREATE DATABASE "MyDatabase";

-- Now connect to the new database.
\c "MyDatabase"

-- ======================================================
-- Table: customers
-- ======================================================
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    country VARCHAR(50),
    score INT,
    CONSTRAINT pk_customers PRIMARY KEY (id)
);

-- Insert customers data
INSERT INTO customers (id, first_name, country, score) VALUES
    (1, 'Maria', 'Germany', 350),
    (2, ' John', 'USA', 900),
    (3, 'Georg', 'UK', 750),
    (4, 'Martin', 'Germany', 500),
    (5, 'Peter', 'USA', 0);

-- ======================================================
-- Table: orders
-- ======================================================
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    sales INT,
    CONSTRAINT pk_orders PRIMARY KEY (order_id)
);

-- Insert orders data
INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    (1001, 1, '2021-01-11', 35),
    (1002, 2, '2021-04-05', 15),
    (1003, 3, '2021-06-18', 20),
    (1004, 6, '2021-08-31', 10);


SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';


-- ======================================================
-- SELECT QUERY
-- ======================================================
SELECT * FROM CUSTOMERS; --use to fetch all the table data 
SELECT id, first_name FROM CUSTOMERS; -- use to fetch specific columns from the table


-- ======================================================
-- WHERE CLAUSE :- Filters data based on condition
-- ======================================================
SELECT * FROM CUSTOMERS WHERE score != 0 -- Retrieve customers with sscore is not equal to 0.
SELECT * FROM CUSTOMERS WHERE country = 'Germany' -- Retrieve customers from germany only.


-- ======================================================
-- ORDER BY CLAUSE
-- ======================================================
SELECT * FROM CUSTOMERS ORDER BY score DESC -- Sort the data in descending order by score. 
SELECT * FROM CUSTOMERS ORDER BY score ASC -- Sort the data in assending order by score.
/*
	Retrieve all customers and sort the results by the country and
	then by the highest score
*/
SELECT * FROM CUSTOMERS ORDER BY country ASC, score DESC -- Multiple sortin, the priority is given to country as its first to sort.


-- ======================================================
-- GROUP BY CLAUSE :- Combines rows with same values
-- ======================================================
SELECT country, SUM(score) FROM CUSTOMERS GROUP BY country; -- Gives total score for each Country
/*
	Note :- You can retrieve only those columns that are mentioned in select, like this
			query is grouping the rows on same country, or else error will occure, and
			use of multiple Aggregate columns is allowed for example

            Find total score and total customers for each country
*/
SELECT country, SUM(score), COUNT(id) FROM CUSTOMERS GROUP BY country;
SELECT country, SUM(score) AS Total_Score, COUNT(id) AS Cus_Count FROM CUSTOMERS GROUP BY country;
/*
	AS is used to name a columns that isn't in the database like in this
	we are fetching total count and score using aggregate function.
*/


-- ==================================================================
-- HAVING CLAUSE :- Filters data after aggregation
-- ==================================================================
SELECT country, SUM(score) FROM CUSTOMERS GROUP BY country HAVING SUM(score) > 450;
/*
	Note :- Having is used only with Group By unlike where clause,
			and it filters data after aggregation unlike where clause.

	SQl :- Find the avg score for each country considering only customers
		   with score not equal to 0 and return only those country with
		   avg score greater than 430.
*/
SELECT country, AVG(score) FROM CUSTOMERS WHERE score != 0 GROUP BY country HAVING AVG(score) > 430;


-- ==================================================================
-- DISTINCT :- Unique values, removes duplicates
-- ==================================================================
SELECT DISTINCT country FROM CUSTOMERS; 
/*
	Note :- Don't use DISTINCT unless it's neccessary, it can slow down your query. 
*/


-- ==================================================================
-- LIMIT :- Restrict the no of rows returned
-- ==================================================================
SELECT * FROM CUSTOMERS LIMIT 3;
SELECT * FROM CUSTOMERS ORDER BY score DESC LIMIT 3; -- Top 3 higest score 
SELECT * FROM CUSTOMERS ORDER BY score ASC LIMIT 2; -- Top 2 lowest score 


-- ==================================================================
-- ==================================================================

-- DAY 2 :- DDL & DML COMMANDS

------------------------- DDL (Data Definition Language) --------------------------------

-- 1) CREATE :- Use to create table in a datbase
CREATE TABLE persons
(
	id INT NOT NULL, 
	person_name VARCHAR(20),
	birth_date DATE,
	phone VARCHAR(10) NOT NULL
);
SELECT * FROM PERSONS;


-- 2) ALTER :- Used to modify or change the table
/*
	Note :- The table will have new column at the end.
			there's no way to add a column in middle of table.
*/
ALTER TABLE PERSONS ADD email VARCHAR(50);
SELECT * FROM PERSONS;
ALTER TABLE PERSONS DROP COLUMN phone; -- used to delete the column.


-- DELETE :- Used to delete table and Columns
ALTER TABLE PERSONS DROP COLUMN email;
DROP TABLE PERSONS; -- This will delete the table from DataBase.


------------------------- DML (Data Manipulation Language) --------------------------------

-- 1) INSERT :- Used to insert values in a table.
--- Manual way to insert ---
SELECT * FROM CUSTOMERS;
INSERT INTO CUSTOMERS (id, first_name, country, score) values
	(6,'Anna','USA',NULL),
	(7,'Sam',NULL,100);
/*
	Note :- No of values entered should be same as column
			mentioned in the query if column is specified. 
*/
-- INSERT using SELECT ---
/*
	copy data from customers table into persons
*/
SELECT * FROM PERSONS; -- Check what data we have to enter  
SELECT id, first_name, NULL, 'UNKNOWN' FROM customers; -- Use static (fixed values) select for column like phone and birth_date.

INSERT INTO persons(id, person_name, birth_date, phone)
	SELECT id, first_name, NULL, 'UNKNOWN' 
	FROM customers;
/*
	NOTE :- Don't use "VALUES" when copying data from a table to another using insert and select.
*/


-- 2) UPDATE :- Used to update/modify the table data
UPDATE CUSTOMERS SET score = 0 WHERE id=6;
SELECT * FROM CUSTOMERS;
/*
	Note :- 1. Always use where to avoid updating all rows unintentionally
			2. Best practice is to check the row before update
			   to check use select query with where clause 
*/
SELECT * FROM CUSTOMERS WHERE id = 7; -- CHECK BEFORE UPDATE
UPDATE CUSTOMERS SET score = 0, country = 'UK' WHERE id = 7;\
SELECT * FROM CUSTOMERS WHERE score IS NULL;
UPDATE CUSTOMERS SET score = 0 WHERE score IS NULL;
/*
	Note :- Use 'IS NULL OR NOT NULL' in where condition
*/


-- 3) DELETE :- Use to delete rows in a table
DELETE FROM CUSTOMERS WHERE id > 5  -- Delete all the rows which has id grreater than 5.
/*
	Note :- 1. Always use where to avoid deleting all rows unintentionally
			2. Best practice is to check the row before delete
			   to check use select query with where clause 
*/
TRUNCATE TABLE PERSONS; -- Much faster than delete 

--===================================================================	

---- OPERATORS ----

-- 1) COMPARISION :- '=' , '<> !=' , '<' , '<=' , '>' , '>='
-- 2) LOGICAL :- 'AND' , 'OR' , 'NOT'
-- 3) RANGE :- 'BETWEEN'
-- 4) MEMBERSHIP :- 'IN' , 'NOT IN'
-- 5) SEARCH :- 'LIKE'

--==========================================================================================
-----------------------------  AND , OR , NOT  ---------------------------------------------

-- Retrieve all the customers who are from USA and have a score greater than 500
SELECT * FROM CUSTOMERS WHERE country = 'USA' AND score > 500;

-- Retrieve all the customers who are either from USA or have a score greater than 500
SELECT * FROM CUSTOMERS WHERE country = 'USA' OR score > 500;

-- Retrieve all the customers with a score not less than 500
SELECT * FROM CUSTOMERS WHERE NOT score < 500;


------------------------------   BETWEEN   -----------------------------

-- Retrieve all the customers whose score falls in the range between 100 and 500
SELECT * FROM CUSTOMERS WHERE score BETWEEN 100 AND 500;
SELECT * FROM CUSTOMERS WHERE score >= 100 AND score <= 500;  -- You can use OR operator also


------------------------------  MEMBERSHIP  -----------------------------

-- Retrieve all customers from either germany OR USA.
/*
	Note :- Use 'IN' instead of 'OR' for multiple values
			in the same column to simplify SQL.
*/
SELECT * FROM CUSTOMERS WHERE COUNTRY IN('Germany','USA');
-- Reverse if 'IN' is 'NOT IN'
SELECT * FROM CUSTOMERS WHERE COUNTRY NOT IN('Germany','USA'); -- all the customers which are not from either Germany or USA


---------------------------  SEARCH  ---------------------------

/*
	Note :- 'LIKE' seacrh for a patterns in text and uses '%' , '_' 

	'%' -> 1) 'M%' - Returns the text which starts from 'M' doesn't matter what is after 'M'
		   2) '%n' - Returns the text which ends with 'n' doesn't matter what is before 'n'
		   3) '%n%' - Returns the text which has 'n' in between and doesn't matter where does it start and end.

	'_' -> 1) '_b%' - Returns the text only and only if it has 'b' on 2nd position 
*/

-- Find all customers whose 1st name start with 'M'
SELECT * FROM CUSTOMERS WHERE first_name LIKE 'M%';
-- Find all customers whose name ends with 'n'
SELECT * FROM CUSTOMERS WHERE first_name LIKE '%n';
-- Find all customers whose name contains 'r' in it
SELECT * FROM CUSTOMERS WHERE first_name LIKE '%r%';

-- Find all customers whose name has 'r' in the 3rd position
SELECT * FROM CUSTOMERS WHERE first_name LIKE '__r%';
 

--==========================================================================================



