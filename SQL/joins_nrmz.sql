 -- Joins + Normalization
CREATE DATABASE Flipkart;
USE Flipkart;
CREATE TABLE Customer(
    C_id INT PRIMARY KEY AUTO_INCREMENT,
    C_name VARCHAR(50),
    C_mobile VARCHAR(60)

);



CREATE TABLE Products(
    Prdct_id INT PRIMARY KEY AUTO_INCREMENT,
    C_id INT,
    Prdct_name VARCHAR(50),
    Prdct_mobile VARCHAR(11),
    FOREIGN KEY (C_id) REFERENCES Customer(C_id)

);


CREATE TABLE Orders(
    Order_id INT PRIMARY KEY AUTO_INCREMENT,
    C_id INT,
    Order_Name VARCHAR(50),
    Prdct_mobile VARCHAR(11),
    FOREIGN KEY (C_id) REFERENCES Customer(C_id)
);



INSERT INTO Customer (C_id, C_name, C_mobile) VALUES
(1,'Arun Kumar', '9001234567'),
(2,'Priya', '9012345678'),
(3,'Suresh', '9023456789'),
(4,'Meena', '9034567890');



INSERT INTO Products (C_id, Prdct_name, Prdct_mobile) VALUES
(1, 'iPhone 15', '9876543210'),
(2, 'Samsung S23', '9123456780'),
(3, 'Realme 12 Pro', '9988776655'),
(4, 'OnePlus Nord', '9090909090');



INSERT INTO Orders (C_id, Order_Name, Prdct_mobile) VALUES
(1, 'iPhone Case Order', '9876543210'),
(2, 'Samsung Charger Order', '9123456780'),
(3, 'Realme Earbuds Order', '9988776655'),
(4, 'OnePlus Cable Order', '9090909090');



-- Inner Join Task-1

SELECT 
    c.c_name,
    p.prdct_name,
    o.order_name
FROM Orders o
INNER JOIN Customer c ON o.C_id = c.C_id
INNER JOIN Products p ON o.Prdct_mobile = p.Prdct_mobile;



-- Inner Join Task-2

SELECT 
    p.prdct_name,
    COUNT(o.order_id) AS total_orders
FROM Products p
INNER JOIN Orders o ON p.Prdct_mobile = o.Prdct_mobile
GROUP BY p.prdct_id, p.prdct_name;



-- Left Join Task-1

SELECT 
    c.c_name,
    COUNT(o.order_id) AS total_orders
FROM Customer c
LEFT JOIN Orders o ON c.c_id = o.c_id
GROUP BY c.c_id, c.c_name;



-- Left Join Task-2

SELECT 
    p.prdct_name,
    CASE 
        WHEN o.order_id IS NOT NULL THEN 'yes'
        ELSE 'no'
    END AS was_ordered
FROM Products p
LEFT JOIN Orders o ON p.Prdct_mobile = o.Prdct_mobile
GROUP BY p.prdct_id, p.prdct_name, o.order_id;



-- Right Join Task-1

SELECT 
    o.order_id,
    o.order_name,
    COALESCE(c.c_name, 'customer deleted') AS customer_name
FROM Customer c
RIGHT JOIN Orders o ON c.c_id = o.c_id;


-- Right Join Task-2

SELECT 
    o.order_id,
    o.order_name,
    COALESCE(p.prdct_name, 'product deleted') AS product_name
FROM Products p
RIGHT JOIN Orders o ON p.Prdct_mobile = o.Prdct_mobile;