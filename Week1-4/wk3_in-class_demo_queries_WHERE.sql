SELECT 9 * 217;

SELECT UPPER('hello') Greeting;

SELECT 5 >= 'eleven'; -- returns TRUE/1 because 'eleven' evaluates to 0
SELECT 5 >= '11';     -- returns FALSE/0 because '11' evaluates to 11

SELECT null = null; -- return false
SELECT null IS null; -- return true
SELECT null IS NOT null; -- return false

USE world;

SELECT name AS Country
-- , LifeExpectancy AS "Life Expectancy" 
FROM country
WHERE LifeExpectancy >= 70;

SELECT country.name as country, city.population
FROM country
JOIN city on city.countrycode = country.code   -- adds the city table to the query 
WHERE city.population > 1000000; -- Population is greater than a million

SELECT name AS Country
, LifeExpectancy AS "Life Expectancy" 
, Population
, GNP
FROM country
WHERE LifeExpectancy >= 70 AND Population >=1000000; 
-- AND is more restrictive (both conditions must be met), while OR is more inclusive (either condition must be must, but doesn't have to meet both)

SELECT name AS Country
, LifeExpectancy AS "Life Expectancy" 
, Population
, GNP
FROM country
WHERE LifeExpectancy >= 70 AND (Population >=1000000 OR GNP > 5000); -- grouping 2nd two conditions using parentheses

SELECT Name -- AS Country
, LifeExpectancy AS "Life Expectancy" 
, Population
, GNP
FROM country
WHERE (LifeExpectancy >= 70 AND Population >=1000000) OR GNP > 5000; -- grouping 1st two conditions using parentheses