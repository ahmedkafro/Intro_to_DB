import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Establish connection to the MySQL server
        # Replace 'your_username' and 'your_password' with your actual credentials
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='K@fr0@sql123'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Creating the database using IF NOT EXISTS to avoid errors
            # We use the raw query directly as per the requirements
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        # Handling connection and execution errors
        print(f"Error while connecting to MySQL: {e}")
    
    finally:
        # Ensure the connection is closed properly
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            # No print here to keep the output clean as per instructions

if __name__ == "__main__":
    create_database()

