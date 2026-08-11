USE online_shopping;
SHOW TABLES;
USE online_shopping;

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS customer;
CREATE TABLE Customer(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    C_Name VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(150) NOT NULL,
    password VARCHAR(100)
);

CREATE TABLE Products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(100) NOT NULL,
    category VARCHAR(150),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE cart(
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    Status_A VARCHAR(200),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Payments(
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

SHOW TABLES;
INSERT INTO Customer (C_Name, email, phone, address, password)
VALUES
('Raju', 'raju@gmail.com', '9876543210', 'Ongole', '1234'),
('Kiran', 'kiran@gmail.com', '9876543211', 'Guntur', '2345'),
('Suresh', 'suresh@gmail.com', '9876543212', 'Vijayawada', '3456');
select * from Customer;
INSERT INTO Products (p_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Mobile Phone', 'Electronics', 20000.00, 20),
('Headphones', 'Electronics', 1500.00, 30),
('Keyboard', 'Accessories', 800.00, 15),
('Mouse', 'Accessories', 500.00, 25);
select* from Products;
INSERT INTO cart (customer_id, product_id, quantity)
VALUES (1, 1, 1);
SELECT 
    c.C_Name AS Customer,
    p.p_name AS Product,
    p.price AS Price,
    ca.quantity AS Quantity,
    p.price * ca.quantity AS Total
FROM cart ca
JOIN Customer c 
    ON ca.customer_id = c.customer_id
JOIN Products p 
    ON ca.product_id = p.product_id;
INSERT INTO Orders (customer_id, order_date, total_amount, Status_A)
VALUES (1, CURDATE(), 55000.00, 'Placed');
SELECT * FROM Orders;
INSERT INTO Payments (order_id, payment_method, amount)
VALUES (1, 'UPI', 55000.00);
SELECT * FROM Payments;
SELECT
    o.order_id AS Order_ID,
    c.C_Name AS Customer,
    o.order_date AS Order_Date,
    o.total_amount AS Total_Amount,
    p.payment_method AS Payment_Method,
    p.amount AS Paid_Amount,
    o.Status_A AS Status
FROM Orders o
JOIN Customer c
    ON o.customer_id = c.customer_id
JOIN Payments p
    ON o.order_id = p.order_id;
SELECT * FROM online_shopping.cart;
SELECT * FROM online_shopping.cart;
SELECT * FROM online_shopping.cart;
USE online_shopping;
SELECT @@hostname, @@port, DATABASE();
SELECT * FROM online_shopping.Orders;
USE online_shopping;

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);