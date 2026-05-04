/* Looking at Exercise 2B:

4. Create a single query to list the order id, ship name, ship address, and shipping company name of every order that shipped to Germany. Assign the shipping company name the alias ‘Shipper.’ Order by the name of the shipper, then the name of who it shipped to.

5. Start from the same query as above (#4), but omit OrderID and add logic to group by ship name, with a count of how many orders were shipped for that ship name.
*/

-- tables to use: orders, shipper

SELECT orders.OrderID, orders.ShipName, orders.ShipAddress, shippers.CompanyName AS Shipper, orders.ShipCountry FROM orders
JOIN shippers
ON orders.ShipVia = shippers.ShipperID
WHERE orders.ShipCountry = "Germany"
ORDER BY Shipper, ShipName;

-- same query using table aliases
SELECT o.OrderID, o.ShipName, o.ShipAddress, s.CompanyName Shipper, o.ShipCountry FROM orders o
JOIN shippers s
ON o.ShipVia = s.ShipperID;

-- using GROUP BY with northwind
SELECT orders.ShipName, count(ShipName) AS "Number of Orders", orders.ShipAddress, shippers.CompanyName AS Shipper, orders.ShipCountry FROM orders
JOIN shippers
ON orders.ShipVia = shippers.ShipperID
WHERE orders.ShipCountry = "Germany"
GROUP BY ShipName, ShipAddress, Shipper, ShipCountry
HAVING `Number of Orders` > 1
ORDER BY Shipper, ShipName
LIMIT 5;

-- ---------------------------------------

-- examples using world

USE world;

SELECT Name AS Country, Continent, Region FROM Country;

-- string concatenation
SELECT Name AS Country, CONCAT(Region, " (", Continent, ")") AS Region FROM country;
SELECT Name AS Country, CONCAT_WS(", ", Region, Continent) AS Region FROM country;

-- joining multiple tables and creating a new view
CREATE VIEW country_city_countrylanguage AS
SELECT country.code, city.name AS city, country.name AS country, countrylanguage.language FROM city
JOIN country ON city.countrycode = country.code
JOIN countrylanguage ON country.code = countrylanguage.countrycode;

-- more with aggregation functions
SELECT MAX(Population), MIN(Population), AVG(Population) FROM country
WHERE Population > 0;

-- adding more columns and working with GROUP BY and HAVING
SELECT 
	Continent, 
    Region, 
    FORMAT(MAX(Population), 0) AS "Highest Pop", 
    FORMAT(MIN(Population), 0) AS "Lowest Pop", 
    FORMAT(AVG(Population), 0) AS "Average Country Population"
FROM country
WHERE Population > 0
GROUP BY Continent, Region
HAVING AVG(Population) >= 10465594.4444
ORDER BY Continent, MAX(Population);

-- using the DISTINCT keyword with COUNT
SELECT COUNT(DISTINCT Continent) from country;

-- ---------------------------------------

-- working with sakila

USE sakila;

-- experimenting with different ways to search for date values
SELECT rental_date from rental
-- WHERE rental_date = '2005-05-24'        -- will not work because not identical to stored values
-- WHERE rental_date LIKE '2005-05-24%'    -- using LIKE to search for only the date portion of the original datetime value
-- WHERE DATE(rental_date) = '2005-05-24'  -- converts rental_date from datetime to date before testing the condition
-- WHERE (rental_date) LIKE '2005-05%'     -- using LIKE to search for dates matching year and month (any day, any time)
WHERE YEAR(rental_date) = 2005             -- converts rental_date to a 4-digit year before testing the condition
;

-- also can use date functions on values returned by query
SELECT DATE(rental_date) from rental;

SELECT MAX(DATE(rental_date)) from rental;

-- hey guys, check it out! I finally found an interval calucation that worked 
-- to bring back a list of rentals from 248 months ago (as of today, that's 8/22/2005)
SELECT rental_date from rental
WHERE date(rental_date) = date_sub(curdate(), INTERVAL 248 MONTH)
-- WHERE date(rental_date) = '2005-08-22'
;

-- aggregation functions to describe how long the Sakila Movie Rental business was in operation
SELECT 
	MAX(rental_date) AS MostRecentRental, 
    MIN(rental_date) AS OldestRental, 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS LifeSpanOfMovieRentals
from rental;

-- building a complex query combining date search, joins, and aggregation logic
SELECT 
	DATE(rental_date) AS Rented, 
    Title, 
    COUNT(*) AS "Number of times rented" 
from rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE rental_date > "2005-05-24" AND rental_date < "2005-05-26"
GROUP BY title, Rented
HAVING `Number of times rented` > 1
;