-- ONLINE SHOPPING SYSTEM

CREATE DATABASE IF NOT EXISTS online_shopping;

USE online_shopping;


-- CUSTOMER TABLE

CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    C_Name VARCHAR(50) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(150) NOT NULL,
    password VARCHAR(100)
);


-- PRODUCTS TABLE

CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(100) NOT NULL,
    category VARCHAR(150),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);


-- CART TABLE

CREATE TABLE IF NOT EXISTS Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- ORDERS TABLE

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    Status_A VARCHAR(200),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);


-- ORDER ITEMS TABLE

CREATE TABLE IF NOT EXISTS Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- PAYMENTS TABLE

CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


-- SAMPLE CUSTOMER DATA

INSERT INTO Customer
(C_Name, email, phone, address, password)
VALUES
('Raju', 'raju@gmail.com', '9876543210', 'Ongole', '1234'),
('Kiran', 'kiran@gmail.com', '9876543211', 'Guntur', '2345'),
('Suresh', 'suresh@gmail.com', '9876543212', 'Vijayawada', '3456');


-- SAMPLE PRODUCT DATA

INSERT INTO Products
(p_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Mobile Phone', 'Electronics', 20000.00, 20),
('Headphones', 'Electronics', 1500.00, 30),
('Keyboard', 'Accessories', 800.00, 15),
('Mouse', 'Accessories', 500.00, 25);


-- VIEW DATA

SELECT * FROM Customer;

SELECT * FROM Products;

SELECT * FROM Cart;

SELECT * FROM Orders;

SELECT * FROM Order_Items;

SELECT * FROM Payments;