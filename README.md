# 🛒 Online Shopping System

## 📌 Project Overview

The **Online Shopping System** is a console-based shopping application developed using **Python and MySQL**.

The application allows a customer to view available products, select a product and quantity, add the product to a shopping cart, place an order, choose a payment method, and receive an order confirmation.

This project demonstrates how Python can be integrated with a MySQL relational database to perform real-world database operations.

---

## 🔄 Project Flow

```text
Customer
   ↓
View Products
   ↓
Select Product
   ↓
Enter Quantity
   ↓
Add to Cart
   ↓
Calculate Cart Total
   ↓
Place Order
   ↓
Store Order Items
   ↓
Choose Payment Method
   ↓
Payment Successful
   ↓
Order Confirmation
   ↓
Cart Automatically Cleared
```

---

## ✨ Features

* View available products
* Select product by Product ID
* Enter required quantity
* Check product availability and stock
* Add product to cart
* Calculate cart total
* Place an order
* Store order details
* Store order items
* Choose payment method
* UPI payment option
* Card payment option
* Cash on Delivery option
* Store payment details
* Display order confirmation
* Automatically clear the cart after successful payment

---

## 🛠️ Technologies Used

* **Python**
* **MySQL**
* **SQL**
* **MySQL Connector for Python**

---

## 🗄️ Database Tables

The project uses the following tables:

### 1. Customer

Stores customer information.

```text
customer_id
C_Name
email
phone
address
password
```

### 2. Products

Stores product information.

```text
product_id
p_name
category
price
stock
```

### 3. Cart

Stores products selected by the customer.

```text
cart_id
customer_id
product_id
quantity
```

### 4. Orders

Stores order information.

```text
order_id
customer_id
order_date
total_amount
Status_A
```

### 5. Order_Items

Stores the products included in each order.

```text
order_item_id
order_id
product_id
quantity
price
```

### 6. Payments

Stores payment information.

```text
payment_id
order_id
payment_method
amount
```

---

## 🔗 Database Relationship

```text
Customer
   |
   | customer_id
   ↓
Cart
   |
   | product_id
   ↓
Products

Customer
   |
   | customer_id
   ↓
Orders
   |
   | order_id
   ↓
Order_Items
   |
   | product_id
   ↓
Products

Orders
   |
   | order_id
   ↓
Payments
```

---

## ▶️ How to Run

### Step 1: Install Python

Make sure Python is installed on your computer.

Check using:

```bash
python --version
```

### Step 2: Install MySQL Connector

```bash
pip install mysql-connector-python
```

### Step 3: Setup MySQL Database

Open **MySQL Workbench** and execute the SQL commands from:

```text
projectt.sql
```

Create the database:

```sql
CREATE DATABASE online_shopping;
```

Then select it:

```sql
USE online_shopping;
```

Create the required tables and insert the product data.

### Step 4: Configure Database Connection

Open `main.py` and update the MySQL connection details.

**Do not upload your real MySQL password to GitHub.**

### Step 5: Run the Application

Open PowerShell inside the project folder:

```bash
python main.py
```

---

## 💻 Example

The application displays products such as:

```text
========== AVAILABLE PRODUCTS ==========

1 Laptop        55000.00
2 Mobile Phone  20000.00
3 Headphones     1500.00
4 Keyboard        800.00
5 Mouse           500.00
```

The customer can select:

```text
Enter Product ID: 3
Enter Quantity: 2
```

The application then adds the product to the cart and calculates the total.

The customer can choose:

```text
1. UPI
2. Card
3. Cash on Delivery
```

After successful payment, the application displays the order confirmation.

---

## 📊 Sample Output

```text
Product : Headphones
Price   : 1500.00
Quantity: 2

Product added to cart successfully!

Cart Total: 3000.00

Order placed successfully!
Order ID: 1
Order Amount: 3000.00

Payment Methods:

1. UPI
2. Card
3. Cash on Delivery

Choose Payment Method: 1

Payment successful!

Payment ID : 1
Order ID   : 1
Method     : UPI
Amount     : 3000.00

========================================
          ORDER CONFIRMATION
========================================

Customer : Raju
Order ID : 1

Products:
Headphones x 2 = 3000.00

Total Amount : 3000.00
Payment      : UPI
Status       : Placed

========================================
       THANK YOU FOR SHOPPING!
========================================
```

---

## 🎯 Learning Outcomes

Through this project, I learned:

* Python programming
* SQL queries
* MySQL database management
* Python-MySQL connectivity
* CRUD operations
* Primary keys and foreign keys
* Database relationships
* Shopping cart management
* Order management
* Payment data management
* Git and GitHub

---

## 🚀 Future Improvements

Possible future improvements include:

* Customer registration and login
* Multiple products in a single purchase
* Product search
* Product categories
* Stock reduction after purchase
* Order history
* GUI or web interface
* Online payment gateway integration

---

## 👨‍💻 Author

**Kataru Venkata Thirumala Raju**

B.Tech – Computer Science and Engineering (Data Science)

---

## 🔗 GitHub

[Online Shopping System](https://github.com/rajukataru/OnlineShopping)
