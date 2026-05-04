# This is a set of sample queries from class 4/14/26

-- This is another way to write a comment.

USE sakila; # sakila is the sample database we are using

SELECT * FROM ACTOR;

/*This is a multi-line comment.
I am writing some things about my code.
What do you think of this script?*/

SELECT actor.first_name, last_name /*Are these the right columns?*/ FROM actor;

SELECT 
	first_name,
    last_name
FROM
	actor;
    
    
SELECT 3 * 27;

SELECT 'hello!';

SELECT datediff("2026-04-01", "2026-04-14");