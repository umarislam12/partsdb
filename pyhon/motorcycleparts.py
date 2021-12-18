import mysql.connector
from mysql.connector import errorcode
# a function that takes connection and query and return everything in the list
def select(conn,query):
    cursor = conn.cursor()
    cursor.execute(query)
    results = []
    for row in cursor.fetchall():
        results.append(row)
    cursor.close()
    return results
   # a function that takes connection and query and commits the query 
def execute(conn,query):  # update, delete, and insert
    cursor = conn.cursor()
    cursor.execute(query)
    conn.commit()
    # a function that prints the resulttothe screen
def show(rows):
    for row in rows:
        print(row)
# trying to establish connection to the database
try:
    conn = mysql.connector.connect(
        user="root",
        password="",
        host="localhost",
        database="motorcycleparts")
except mysql.connector.Error as err:
    print("Cannot connect.")
    exit()
# storing query in variable


# function call
rows = select(conn,"select * from customer")
# function call
show(rows)
rows = select(conn,"select * from employees")
# function call
show(rows)
rows = select(conn,"select * from job")
# function call
show(rows)
rows = select(conn,"select * from product")
# function call
show(rows)
rows = select(conn,"select * from purchase_order")
# function call
show(rows)
rows = select(conn,"select * from supplier")
# function call
show(rows)
