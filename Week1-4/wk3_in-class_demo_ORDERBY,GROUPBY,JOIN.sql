-- Examples of acceptable query structure using white space to make query more readable

select 
	EmployeeID
    , FirstName
    , LastName
    , BirthDate
from employees;

 SELECT EmployeeID, FirstName, LastName, BirthDate 
	FROM employees;
    
SELECT EmployeeID, 
FirstName, 
LastName, 
BirthDate 
FROM employees;


-- QUERY PRACTICE

USE world;

SELECT * FROM countrylanguage
WHERE Language IN ('dutch', 'spanish', 'english');

SELECT * FROM countrylanguage
-- WHERE Percentage BETWEEN 9.5 AND 44.6
WHERE Percentage >= 9.5 AND Percentage <= 44.6;

SELECT country.Name FROM country
WHERE Name LIKE "A%";

SELECT country.Name FROM country
WHERE Name LIKE "%land%";

SELECT country.Name FROM country
WHERE Name LIKE "%lan__";

-- Answering Questions

-- Null values in country - LifeExpectancy
SELECT Name, LifeExpectancy from country
WHERE LifeExpectancy IS null;

-- List of countries w/ population greater than 1,000
SELECT Name, Population from country
WHERE Population > 1000;

-- What country has a surface area of less than 10000?
SELECT SurfaceArea, Name FROM country
WHERE SurfaceArea < 10000
ORDER BY SurfaceArea ASC;

SELECT SurfaceArea, Name FROM country
WHERE SurfaceArea < 10000
ORDER BY SurfaceArea DESC;

SELECT SurfaceArea, Name, Continent FROM country
WHERE SurfaceArea < 10000
ORDER BY Continent, Name DESC;

SELECT Name, Population FROM country
ORDER BY Population DESC
LIMIT 25;

SELECT DISTINCT Continent, Region FROM country
ORDER BY Continent;

SELECT Continent, Region FROM country  -- by comparison, without DISTINCT
ORDER BY Continent;

-- population density calculation - how many people per square mile?
SELECT 
	Name AS Country, 
	SurfaceArea, 
	Population, 
	Population / SurfaceArea AS "Population Density" 
FROM country 
WHERE Population > 0
ORDER BY `Population Density` DESC;

-- Aggregate functions

SELECT avg(Population)
	, Continent 
FROM country
-- WHERE Continent = "Asia"
GROUP BY Continent
ORDER BY Continent ASC;

-- example of same set of records NOT aggregated
SELECT Population, Continent FROM country
ORDER BY Continent, Population DESC;


-- Working with joins

-- inner join
SELECT country.Name AS Country, countrylanguage.Language FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode;

-- another inner join
-- but first, we're going to add a record
ALTER TABLE city
	MODIFY COLUMN CountryCode CHAR(3),
	MODIFY COLUMN District CHAR(20);
INSERT INTO city
	VALUES (4080, 'Freetown Christiania', NULL, NULL, 850);

-- so, now the joins! inner join: 4,079
SELECT city.Name as City, city.Population, country.Name AS Country, country.Region
FROM country
INNER JOIN city
ON country.Code = city.CountryCode;

-- left outer join
SELECT country.Code, city.Name as City, city.Population, country.Name AS Country, country.Region
FROM country
LEFT JOIN city
ON country.Code = city.CountryCode;

SELECT country.Code, city.Name as City, city.Population, country.Name AS Country, country.Region
FROM country
JOIN city
ON country.Code = city.ID; -- these column values don't actually match, so will produce zero results

SELECT c2.Name as City, c2.Population, c.Name AS Country, c.Region
FROM country AS c
LEFT JOIN city AS c2
ON c.Code = c2.CountryCode;

SELECT country.Code, city.Name as City, city.Population, country.Name AS Country, country.Region
FROM country
RIGHT JOIN city
ON country.Code = city.CountryCode;

SELECT country.Code, city.Name as City, city.Population, country.Name AS Country, country.Region
FROM city
RIGHT JOIN country
ON country.Code = city.CountryCode;

-- equivalent to a full outer join -- combining a left and right join using union
SELECT city.Name, city.Population, country.Name, country.Region FROM city
LEFT JOIN country
on city.CountryCode = country.Code
UNION
SELECT city.Name, city.Population, country.Name, country.Region FROM city
RIGHT JOIN country
on city.CountryCode = country.Code
;

-- what does it look like to join 3 tables?
SELECT city.Name, country.Name, Language FROM city
JOIN country
ON city.CountryCode = country.Code
JOIN countrylanguage
ON country.Code = countrylanguage.Language;

