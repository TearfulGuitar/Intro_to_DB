import mysql.

# Database connection details (replace with your own)
mydb = mysql.connector.connect(
    host="localhost",
    user="Robert",
    password="1234",
    database="alx_book_store"
)

mycursor = mydb.cursor()
USE alx_book_store;

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Optionally, you can insert some test data to check the schema

-- Inserting authors
INSERT INTO Authors (author_name) VALUES ('George Orwell'), ('J.K. Rowling');

-- Inserting books
INSERT INTO Books (title, author_id, price, publication_date) 
VALUES ('1984', 1, 9.99, '1949-06-08'),
       ('Harry Potter and the Philosopher\'s Stone', 2, 12.99, '1997-06-26');

-- Inserting customers
INSERT INTO Customers (customer_name, email, address) 
VALUES ('Alice Johnson', 'alice@example.com', '1234 Elm Street'),
       ('Bob Smith', 'bob@example.com', '5678 Oak Street');

-- Inserting orders
INSERT INTO Orders (customer_id, order_date) 
VALUES (1, '2024-10-23'),
       (2, '2024-10-24');

-- Inserting order details
INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (1, 1, 2), 
       (2, 2, 1);

