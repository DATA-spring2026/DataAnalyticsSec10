USE sakila;

-- working with set operations

-- UNION combines records from the first set plus records from the second set
SELECT first_name, last_name, email FROM staff
UNION
SELECT first_name, last_name, email FROM customer;

SELECT first_name FROM staff
UNION
SELECT first_name FROM customer;

SELECT first_name FROM staff
UNION ALL                        -- turns off deduplication
SELECT first_name FROM customer;

-- only returns the overlap where results from the first set also belong to the second set
SELECT first_name FROM staff
INTERSECT
SELECT first_name FROM customer;

SELECT first_name, email FROM staff
INTERSECT
SELECT first_name, email FROM customer;

SELECT first_name, email FROM staff
WHERE first_name IN ("Mike", "Jon")
UNION
SELECT first_name, email FROM customer
WHERE first_name IN ("Mike", "Jon");

-- example using EXCEPT
-- returns the rows from the first set, minus any rows from the second set
-- the order matters! both staff names also appear in customer.first_name so the EXCEPT result yields zero records
SELECT first_name FROM staff
EXCEPT
SELECT first_name FROM customer;

-- flipping around the tables, there are a bunch of customer names that don't match on the staff names, so this gets results
SELECT first_name FROM customer
EXCEPT
SELECT first_name FROM staff;

-- another set of UNION examples
USE world;

SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.GNP > 1000000
UNION 
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.Population > 50000000;

-- using INTERSECT
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.GNP > 1000000
INTERSECT 
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.Population > 50000000;

-- using EXCEPT
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.GNP > 1000000
EXCEPT 
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.Population > 50000000;

-- changing second query from "greater than 50 million" to "less than 50 million"
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.GNP > 1000000
EXCEPT 
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.Population < 50000000;

-- flipping around the query order
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.Population > 50000000
EXCEPT
SELECT Language FROM countrylanguage
JOIN country ON country.code = countrylanguage.countrycode
WHERE country.GNP > 1000000;


-- --------------

-- working with Common Table Expressions (CTEs)

-- comparing of subquery syntax versus CTE

SELECT 
    ROUND(AVG(GNP), 0) AS "Avg GNP by Region",
    ROUND(
        (SELECT AVG(country2.GNP) 
         FROM country AS country2
         WHERE country2.Continent = country.Continent),  -- correlated subquery: ties to outer query's Continent
        0) AS "Avg GNP by Continent",
    Region,
    Continent
FROM country
GROUP BY Continent, Region
ORDER BY Continent, Region;

-- rewriting as CTE

WITH AvgGNPCont AS (
	SELECT 
		Continent, 
        ROUND(AVG(GNP), 0) AS "Avg GNP by Continent"
    FROM country
    GROUP BY Continent
)
SELECT 
	ROUND(AVG(country.GNP), 0) AS "Avg GNP by Region",
    AvgGNPCont.`Avg GNP by Continent`,
    country.Region,
    country.Continent
FROM country
JOIN AvgGNPCont ON country.Continent = AvgGNPCont.Continent
GROUP BY country.Continent, country.Region, `Avg GNP by Continent`
ORDER BY country.Continent, country.Region;

-- another CTE example

WITH AvgGNPCont AS (
	SELECT 
		Continent, 
        ROUND(AVG(GNP), 0) AS "Avg GNP by Continent"
    FROM country
    GROUP BY Continent
)
SELECT AvgGNPCont.`Avg GNP by Continent` FROM AvgGNPCont
WHERE `Avg GNP by Continent` >= 150106;


- -----------------------------

USE sakila;

-- setting up CASE example

SELECT 
	first_name,
	CASE first_name
		WHEN 'Mike' THEN 'Skip'
        WHEN 'Jon' THEN 'JJ'
        ELSE first_name
        END AS Nickname
FROM staff;

-- alt example using customer table
SELECT 
	first_name,
	CASE first_name
		WHEN 'Mike' THEN 'Skip'
        WHEN 'Jon' THEN 'JJ'
        ELSE first_name
        END AS Nickname
FROM customer
WHERE first_name IN ('Mike', 'Jon', 'Alberto', 'Mary');


-- example using searched CASE structure

SELECT
	customer.customer_id,
    customer.first_name,
    customer.last_name,
    COUNT(rental.rental_id) AS num_of_rentals, 
    CASE
		WHEN COUNT(rental.rental_id) > 35 THEN 'Platinum VIP'
        WHEN COUNT(rental.rental_id) > 25 THEN "Gold VIP"
        WHEN COUNT(rental.rental_id) > 15 THEN 'VIP'
        ELSE 'none'
	END AS 'VIP Status'
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY num_of_rentals;

