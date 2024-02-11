use jo;
CREATE TABLE Books (
    Book_Id INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);
CREATE TABLE Customers (
    Customer_Id INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_Id INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id)
);

INSERT INTO Books (Book_Id, Title, Author, Genre, Price, Stock) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 9.99, 100),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 8.50, 75),
(3, '1984', 'George Orwell', 'Science Fiction', 10.25, 120),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 7.99, 90),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', 6.75, 110),
(6, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 12.99, 85),
(7, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 11.50, 150),
(8, 'To the Lighthouse', 'Virginia Woolf', 'Modernism', 9.25, 65),
(9, 'The Picture of Dorian Gray', 'Oscar Wilde', 'Gothic Fiction', 8.75, 80),
(10, 'Frankenstein', 'Mary Shelley', 'Gothic', 7.25, 95),
(11, 'Moby-Dick', 'Herman Melville', 'Adventure', 11.99, 70),
(12, 'Alice''s Adventures in Wonderland', 'Lewis Carroll', 'Fantasy', 6.99, 120),   
(13, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 19.99, 60),
(14, 'The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', 15.50, 100),
(15, 'Brave New World', 'Aldous Huxley', 'Dystopian Fiction', 10.50, 110),
(16, 'The Odyssey', 'Homer', 'Epic Poetry', 8.99, 85),
(17, 'Hamlet', 'William Shakespeare', 'Tragedy', 7.50, 105),
(18, 'Don Quixote', 'Miguel de Cervantes', 'Satire', 13.25, 75),
(19, 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', 16.75, 90),
(20, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical Fiction', 14.99, 70);

INSERT INTO Customers (Customer_Id, First_Name, Last_Name, Email)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com'),
    (4, 'Michael', 'Brown', 'michael.brown@example.com'),
    (5, 'Emily', 'Williams', 'emily.williams@example.com'),
    (6, 'Daniel', 'Jones', 'daniel.jones@example.com'),
    (7, 'Sarah', 'Martinez', 'sarah.martinez@example.com'),
    (8, 'Matthew', 'Garcia', 'matthew.garcia@example.com'),
    (9, 'Olivia', 'Lopez', 'olivia.lopez@example.com'),
    (10, 'William', 'Lee', 'william.lee@example.com'),
    (11, 'Emma', 'Hernandez', 'emma.hernandez@example.com'),
    (12, 'David', 'Young', 'david.young@example.com'),
    (13, 'Sophia', 'Scott', 'sophia.scott@example.com'),
    (14, 'James', 'Nguyen', 'james.nguyen@example.com'),
    (15, 'Isabella', 'Adams', 'isabella.adams@example.com'),
    (16, 'Benjamin', 'Thomas', 'benjamin.thomas@example.com'),
    (17, 'Ava', 'Roberts', 'ava.roberts@example.com'),
    (18, 'Mason', 'Cook', 'mason.cook@example.com'),
    (19, 'Charlotte', 'Hill', 'charlotte.hill@example.com'),
    (20, 'Ethan', 'Parker', 'ethan.parker@example.com');

INSERT INTO Orders (Order_Id, Customer_Id, Order_Date, Total_Amount)
VALUES 
    (1, 1, '2024-02-08', 50.00),
    (2, 2, '2024-02-08', 75.50),
    (3, 3, '2024-02-07', 30.25),
    (4, 4, '2024-02-07', 40.00),
    (5, 5, '2024-02-06', 65.75),
    (6, 6, '2024-02-05', 22.50),
    (7, 7, '2024-02-05', 90.20),
    (8, 8, '2024-02-04', 55.80),
    (9, 9, '2024-02-03', 70.00),
    (10, 10, '2024-02-03', 80.50),
    (11, 11, '2024-02-02', 35.25),
    (12, 12, '2024-02-02', 60.75),
    (13, 13, '2024-02-01', 45.90),
    (14, 14, '2024-01-31', 20.25),
    (15, 15, '2024-01-31', 95.00),
    (16, 16, '2024-01-30', 27.80),
    (17, 17, '2024-01-29', 33.60),
    (18, 18, '2024-01-29', 75.25),
    (19, 19, '2024-01-28', 42.50),
    (20, 20, '2024-01-28', 88.75);
    
    select * from books;
    select * from customers;
    select * from orders;

DELIMITER $$

CREATE PROCEDURE CalculateTotalRevenue()
BEGIN
  DECLARE totalRevenue DECIMAL(10, 2);
  
  SELECT SUM(Total_Amount) INTO totalRevenue
  FROM Orders;
  
  SELECT CONCAT('Total revenue: $', totalRevenue) AS Result;
END$$

DELIMITER ;

DELIMITER //
CREATE TRIGGER UpdateStock
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Books
    SET Stock = Stock - (SELECT Quantity FROM Order_Details WHERE Order_Id = NEW.Order_Id)
    WHERE Book_Id = (SELECT Book_Id FROM Order_Details WHERE Order_Id = NEW.Order_Id);
END //
DELIMITER ;

SELECT Orders.Order_Id, Customers.First_Name, Customers.Last_Name, Orders.Order_Date, Orders.Total_Amount
FROM Orders
JOIN Customers ON Orders.Customer_Id = Customers.Customer_Id;

DELIMITER //

DELIMITER //

CREATE FUNCTION CalculateAveragePriceInGenre(genre_name VARCHAR(50))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avg_price DECIMAL(10, 2);

    SELECT AVG(Price) INTO avg_price
    FROM Books
    WHERE Genre = genre_name;

    RETURN avg_price;
END //

DELIMITER ;

SELECT CalculateAveragePriceInGenre('Fantasy');

CREATE VIEW BestsellingBooks AS
SELECT Book_Id, Title, COUNT(*) AS OrdersCount
FROM Orders
GROUP BY Book_Id, Title
ORDER BY OrdersCount DESC
LIMIT 5;














