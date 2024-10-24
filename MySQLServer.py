import mysql.connector
from mysql.connector import Error

# set up connection with connect method
try:
    mydb = mysql.connector.connect(
        host='localhost', user='root', password='1234')

    # test the connection

    # print(f"Database {mydb.get_server_info()} created succesfully")

    # write you sql queries/print to console
    mycursor = mydb.cursor()

    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

    print(f"Database 'alx_bookstore' created succesfully!")
except mysql.connector.Error as e:
    print(e)
finally:
    # close connection
    mycursor.close()
    mydb.close()
    print("MySQL connection closed.")