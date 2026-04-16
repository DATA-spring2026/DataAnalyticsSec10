DROP DATABASE IF EXISTS sandwich_shop;

CREATE DATABASE sandwich_shop;

USE sandwich_shop;

CREATE TABLE products (
	productid INT PRIMARY KEY AUTO_INCREMENT
    , product VARCHAR(30) NOT NULL
    , price DECIMAL(5,2)
    );

CREATE TABLE sales (
	orderid INT PRIMARY KEY AUTO_INCREMENT
    , orderplaced TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    , customerid INT
);
    
CREATE TABLE sales_detail (
	detailid INT PRIMARY KEY AUTO_INCREMENT
    , productid INT
    , orderid INT
    , CONSTRAINT fk1 FOREIGN KEY (productid) REFERENCES products(productid)
    , CONSTRAINT fk2 FOREIGN KEY (orderid) REFERENCES sales(orderid)
);

INSERT INTO products (product, price)
VALUES
	("Turkey sandwich", 99.99)
;

INSERT INTO products (product, price)
VALUES
	("Roast beef sandwich", 8.99),
    ("Falafel wrap", 8.99),
    ("Bean burrito", 7.99),
    ("Fries, small", 2.99),
    ("Fries, med", 3.99),
    ("Fries, large", 4.50),
    ("Drink, small", 2.49),
    ("Drink, med", 3.49),
    ("Drink, large", 3.99)
;

INSERT INTO sales (customerid)
VALUES
	(2),
    (1),
    (NULL)
;

INSERT INTO sales_detail (productid, orderid)
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (8, 1)
;

SELECT sales.orderid, sales.orderplaced, products.product, products.price 
FROM sales
JOIN sales_detail ON sales.orderid = sales_detail.orderid
JOIN products ON products.productid = sales_detail.productid
;