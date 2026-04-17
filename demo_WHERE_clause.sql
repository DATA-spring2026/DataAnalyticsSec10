# WHERE clause examples

UPDATE products
SET productid = 99
WHERE productid = 1;

SELECT * FROM products
WHERE productid = 1 OR productid = 99;

SELECT * FROM products
WHERE price >= 4.50;