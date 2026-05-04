USE world;

-- a couple starting examples to deliver a set of results sliced by a WHERE condition
SELECT Region FROM country
WHERE Region IN ('Caribbean', 'Central Africa', 'Southern Europe');

SELECT DISTINCT Region FROM country
WHERE Region LIKE "%east%";

-- an example of a subquery used within a WHERE clause, referenced by the IN operator
SELECT Name as Country, Region, GNP FROM country
WHERE Region IN
	(SELECT Region FROM country
	WHERE Region IN ('Caribbean', 'Central Africa', 'Southern Europe'))
;

-- another example of a subquery used within a WHERE clause, with the IN operator
SELECT Name as Country, Region, GNP FROM country
WHERE Region IN
	(SELECT DISTINCT Region FROM country
	WHERE Region LIKE "%east%")
;

-- an example of a subquery as a column expression
SELECT
	Name as Country,
    (SELECT MAX(Region) FROM country WHERE Region LIKE "%east%") as Region,  -- this isn't really what we want!
    GNP
FROM country;

SELECT MIN(Name) FROM country WHERE Region LIKE "%east%";

SELECT Name FROM country WHERE Region LIKE "%east%"
ORDER BY Name ASC;

-- setting up an example using AVG at the row level to calculate a region's average GNP
SELECT 
	ROUND(AVG(GNP), 0) AS "Avg GNP", 
    Region, 
    Continent 
FROM country
GROUP BY Continent, Region
ORDER BY Continent, Region;

-- following on above, what if we want to add another column for average GNP at the continent level?
-- using a subquery as a column expression
SELECT 
	ROUND(AVG(GNP), 0) AS "Avg GNP by Region", 
    (SELECT ROUND(AVG(GNP), 0) FROM country AS country2
		WHERE country2.continent = country.continent) 
        AS "Avg GNP by Continent",
    Continent,
    Region
FROM country
GROUP BY Continent, Region
ORDER BY Continent, Region;

SELECT 
	ROUND(AVG(GNP), 0) AS "Avg GNP",  
    Continent 
FROM country
GROUP BY Continent
ORDER BY Continent;

-- joining on the results of a subquery
SELECT country.Name, Language FROM country
JOIN (
	SELECT countrylanguage.countrycode, countrylanguage.language
    FROM countrylanguage
    WHERE Language LIKE ("%u%")
    ) AS cl
ON country.code = cl.countrycode;

-- separately testing out the subquery from above
SELECT countrycode, language
FROM countrylanguage
WHERE Language LIKE ("%u%");


-- working with various examples of using LIKE and IN

USE sakila;

SELECT last_name FROM customer
WHERE last_name IN ('John', 'Johnson', 'Johnston', 'Johnstone', 'Jefferson');

SELECT last_name FROM customer
WHERE last_name LIKE "john%" OR last_name LIKE "jeff%";

SELECT first_name, last_name FROM customer
WHERE customer_id = 4;

SELECT customer_id, first_name, last_name FROM customer
WHERE customer_id LIKE '__';

SELECT customer_id, first_name, last_name FROM customer
WHERE customer_id LIKE '4';


-- setting up a sample query combining joins and GROUP BY
-- customer, rental, inventory, film

SELECT MAX(DATE(rental_date)) AS date, title FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY title
;

-- alternative example using DISTINCT

SELECT DISTINCT YEAR(rental_date) AS Year, title FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
;


-- set operations

-- working with union

-- stacking results for three columns from two different tables
SELECT staff.first_name, staff.last_name, staff.email FROM staff
UNION
SELECT customer.first_name, customer.last_name, customer.email FROM customer;

-- adding a combined column for primary key IDs for each table
SELECT staff.first_name, staff.last_name, staff.email, staff.staff_id AS identifier FROM staff
UNION
SELECT customer.first_name, customer.last_name, customer.email, customer.customer_id FROM customer;

-- adding separate columns for staff_id and customer_id, with NULL as a placeholder where appropriate
SELECT staff.first_name, staff.last_name, staff.email, staff.staff_id, NULL AS customer_id FROM staff
UNION
SELECT customer.first_name, customer.last_name, customer.email, NULL, customer.customer_id FROM customer;