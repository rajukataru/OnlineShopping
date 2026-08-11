import mysql.connector

connection = mysql.connector.connect(
    host="localhost",
    port=3306,
    user="root",
    password="NewPassword123@",
    database="online_shopping"
)

cursor = connection.cursor()

cursor.execute("SELECT @@hostname, @@port, DATABASE()")
print(cursor.fetchone())

cursor.execute("SELECT * FROM Payments")
payments = cursor.fetchall()

print("Payments:")
for payment in payments:
    print(payment)

cursor.close()
connection.close()