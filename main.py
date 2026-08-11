
import mysql.connector

# ==========================================
# MYSQL CONNECTION
# ==========================================

connection = mysql.connector.connect(
    host="localhost",
    port=3306,
    user="root",
    password="NewPassword123@",
    database="online_shopping"
)

print("MySQL connected successfully!")

cursor = connection.cursor()

customer_id = 1


# ==========================================
# SHOW PRODUCTS
# ==========================================

cursor.execute("""
    SELECT product_id, p_name, category, price, stock
    FROM Products
""")

products = cursor.fetchall()

print("\n========== AVAILABLE PRODUCTS ==========")

for product in products:
    print(
        product[0],
        product[1],
        product[2],
        product[3],
        "Stock:",
        product[4]
    )


# ==========================================
# SELECT PRODUCT
# ==========================================

product_id = int(input("\nEnter Product ID: "))
quantity = int(input("Enter Quantity: "))


# ==========================================
# CHECK PRODUCT
# ==========================================

cursor.execute("""
    SELECT p_name, price, stock
    FROM Products
    WHERE product_id = %s
""", (product_id,))

product = cursor.fetchone()


if product is None:

    print("Product not found!")

elif quantity <= 0:

    print("Quantity must be greater than 0!")

elif quantity > product[2]:

    print("Not enough stock!")

else:

    product_name = product[0]
    price = product[1]
    stock = product[2]

    print("\nProduct :", product_name)
    print("Price   :", price)
    print("Quantity:", quantity)
    print("Stock   :", stock)


    # ==========================================
    # ADD PRODUCT TO CART
    # ==========================================

    cursor.execute("""
        INSERT INTO Cart
        (customer_id, product_id, quantity)
        VALUES (%s, %s, %s)
    """, (customer_id, product_id, quantity))

    connection.commit()

    cart_id = cursor.lastrowid

    print("\nProduct added to cart successfully!")
    print("Cart ID:", cart_id)


    # ==========================================
    # SHOW CART
    # ==========================================

    cursor.execute("""
        SELECT
            c.product_id,
            c.quantity,
            p.p_name,
            p.price
        FROM Cart c
        JOIN Products p
            ON c.product_id = p.product_id
        WHERE c.customer_id = %s
    """, (customer_id,))

    cart_items = cursor.fetchall()

    print("\n========== YOUR CART ==========")

    total_amount = 0

    for item in cart_items:

        item_total = item[3] * item[1]

        total_amount += item_total

        print("\nProduct :", item[2])
        print("Price   :", item[3])
        print("Quantity:", item[1])
        print("Total   :", item_total)

    print("\n------------------------------")
    print("Cart Total:", total_amount)


    # ==========================================
    # CREATE ORDER
    # ==========================================

    cursor.execute("""
        INSERT INTO Orders
        (customer_id, order_date, total_amount, Status_A)
        VALUES (%s, CURDATE(), %s, %s)
    """, (customer_id, total_amount, "Placed"))

    order_id = cursor.lastrowid


    # ==========================================
    # ADD TO ORDER_ITEMS
    # ==========================================

    for item in cart_items:

        cursor.execute("""
            INSERT INTO Order_Items
            (order_id, product_id, quantity, price)
            VALUES (%s, %s, %s, %s)
        """, (
            order_id,
            item[0],
            item[1],
            item[3]
        ))

    connection.commit()

    print("\nOrder placed successfully!")
    print("Order ID:", order_id)
    print("Order Amount:", total_amount)


    # ==========================================
    # PAYMENT
    # ==========================================

    print("\n========== PAYMENT ==========")

    print("Order ID :", order_id)
    print("Amount   :", total_amount)

    print("\nPayment Methods:")
    print("1. UPI")
    print("2. Card")
    print("3. Cash on Delivery")

    choice = int(input("\nChoose Payment Method: "))


    if choice == 1:

        payment_method = "UPI"

    elif choice == 2:

        payment_method = "Card"

    elif choice == 3:

        payment_method = "Cash on Delivery"

    else:

        print("Invalid payment method!")

        cursor.close()
        connection.close()
        exit()


    # ==========================================
    # SAVE PAYMENT
    # ==========================================

    cursor.execute("""
        INSERT INTO Payments
        (order_id, payment_method, amount)
        VALUES (%s, %s, %s)
    """, (
        order_id,
        payment_method,
        total_amount
    ))

    connection.commit()

    payment_id = cursor.lastrowid


    print("\nPayment successful!")
    print("Payment ID :", payment_id)
    print("Order ID   :", order_id)
    print("Method     :", payment_method)
    print("Amount     :", total_amount)


    # ==========================================
    # AUTOMATICALLY CLEAR CART
    # ==========================================

    cursor.execute("""
        DELETE FROM Cart
        WHERE customer_id = %s
    """, (customer_id,))

    connection.commit()

    print("\nCart cleared automatically!")


    # ==========================================
    # ORDER CONFIRMATION
    # ==========================================

    print("\n========================================")
    print("          ORDER CONFIRMATION")
    print("========================================")

    print("Customer :", "Raju")
    print("Order ID :", order_id)

    print("\nProducts:")

    for item in cart_items:

        print(
            item[2],
            "x",
            item[1],
            "=",
            item[3] * item[1]
        )

    print("\nTotal Amount :", total_amount)
    print("Payment      :", payment_method)
    print("Payment ID   :", payment_id)
    print("Status       :", "Placed")

    print("\n========================================")
    print("       THANK YOU FOR SHOPPING!")
    print("========================================")


# ==========================================
# CLOSE CONNECTION
# ==========================================

cursor.close()
connection.close()
