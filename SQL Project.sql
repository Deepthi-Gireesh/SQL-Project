CREATE DATABASE Library;
use Library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,  
    Manager_Id INT,  
    Branch_address VARCHAR(255),  
    Contact_no VARCHAR(20)
);
desc Branch;

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,  
    Emp_name VARCHAR(100) NOT NULL,  
    Position VARCHAR(50),  
    Salary DECIMAL(10,2),  
    Branch_no INT,  
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no) ON DELETE CASCADE
);
desc Employee;
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,  
    Book_title VARCHAR(255) NOT NULL,  
    Category VARCHAR(100),  
    Rental_Price DECIMAL(10,2),  
    Status ENUM('Yes', 'No') DEFAULT 'Yes',  
    Author VARCHAR(100),  
    Publisher VARCHAR(100)
);
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255) NOT NULL,
    Customer_address TEXT,
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book) REFERENCES Books(Isbn) ON DELETE CASCADE
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(Isbn) ON DELETE CASCADE
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main Street, New York', '1234567890'),
(2, 102, '456 Elm Street, Los Angeles', '9876543210'),
(3, 103, '789 Oak Street, Chicago', '4567891230'),
(4, 104, '101 Pine Street, Houston', '7891234560'),
(5, 105, '202 Maple Street, Miami', '3216549870'),
(6, 106, '303 Birch Street, San Francisco', '6549873210'),
(7, 107, '404 Cedar Street, Seattle', '8529637410'),
(8, 108, '505 Walnut Street, Denver', '1472583690'),
(9, 109, '606 Cherry Street, Boston', '3692581470'),
(10, 110, '707 Willow Street, Atlanta', '9517538520');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Alice Johnson', 'Manager', 75000, 1),
(102, 'Bob Smith', 'Manager', 72000, 2),
(103, 'Charlie Brown', 'Manager', 70000, 3),
(104, 'David Wilson', 'Manager', 69000, 4),
(105, 'Emily Davis', 'Manager', 68000, 5),
(106, 'Frank Miller', 'Assistant', 55000, 6),
(107, 'Grace Adams', 'Assistant', 53000, 7),
(108, 'Henry White', 'Clerk', 45000, 8),
(109, 'Ivy Clark', 'Clerk', 43000, 9),
(110, 'Jack Lewis', 'Clerk', 42000, 10);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-1234567890', 'The Great Gatsby', 'Fiction', 20.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-2345678901', 'To Kill a Mockingbird', 'Classic', 25.00, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-3456789012', '1984', 'Dystopian', 30.00, 'Yes', 'George Orwell', 'Secker & Warburg'),
('978-4567890123', 'Moby Dick', 'Adventure', 22.00, 'No', 'Herman Melville', 'Harper & Brothers'),
('978-5678901234', 'Pride and Prejudice', 'Romance', 18.00, 'Yes', 'Jane Austen', 'T. Egerton'),
('978-6789012345', 'The Catcher in the Rye', 'Fiction', 27.00, 'No', 'J.D. Salinger', 'Little, Brown and Company'),
('978-7890123456', 'Brave New World', 'Science Fiction', 24.00, 'Yes', 'Aldous Huxley', 'Chatto & Windus'),
('978-8901234567', 'The Hobbit', 'Fantasy', 28.00, 'Yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
('978-9012345678', 'The Lord of the Rings', 'Fantasy', 35.00, 'Yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
('978-0123456789', 'The History of the World', 'History', 40.00, 'No', 'J.M. Roberts', 'Oxford University Press');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Michael Scott', '123 Paper Street, Scranton', '2021-05-10'),
(2, 'Pam Beesly', '456 Art Street, Scranton', '2022-02-15'),
(3, 'Jim Halpert', '789 Sales Street, Scranton', '2020-10-22'),
(4, 'Dwight Schrute', '101 Beet Farm, Scranton', '2019-07-30'),
(5, 'Angela Martin', '202 Cat Street, Scranton', '2021-12-11'),
(6, 'Kevin Malone', '303 Chili Lane, Scranton', '2023-01-25'),
(7, 'Stanley Hudson', '404 Lazy Road, Scranton', '2022-06-19'),
(8, 'Oscar Martinez', '505 Accountant Lane, Scranton', '2023-03-05'),
(9, 'Toby Flenderson', '606 HR Street, Scranton', '2018-09-09'),
(10, 'Ryan Howard', '707 Temp Avenue, Scranton', '2022-11-14');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'The Great Gatsby', '2024-03-01', '978-1234567890'),
(2, 3, '1984', '2024-03-05', '978-3456789012'),
(3, 5, 'Pride and Prejudice', '2024-03-10', '978-5678901234'),
(4, 7, 'The Hobbit', '2024-03-12', '978-8901234567'),
(5, 9, 'The Catcher in the Rye', '2024-03-15', '978-6789012345');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'The Great Gatsby', '2024-03-20', '978-1234567890'),
(2, 3, '1984', '2024-03-25', '978-3456789012'),
(3, 5, 'Pride and Prejudice', '2024-03-28', '978-5678901234');



Select * from Branch;
Select * From Employee;
Select * From Books;
Select * from Customer;
Select * from IssueStatus;
Select * From ReturnStatus;

SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'Yes';

SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;
desc Books;
SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.Isbn
JOIN Customer C ON I.Issued_cust = C.Customer_Id;
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT C.Customer_name 
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT C.Customer_name 
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title 
FROM Books 
WHERE LOWER(Book_title) LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT E.Emp_name, B.Branch_Address
FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no
WHERE E.Position = 'Manager';

SELECT DISTINCT C.Customer_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
JOIN Books B ON I.Isbn_book = B.Isbn
WHERE B.Rental_Price > 25;












