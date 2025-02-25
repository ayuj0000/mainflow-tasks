# Created a Database named EmployeeManagement
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

# Created a Table Employees with folloeing attributes
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2)
);

# Inserted Values in the table
INSERT INTO Employees (Name, JobTitle, Salary)
VALUES 
('John Doe', 'Software Engineer', 75000.00),
('Jane Smith', 'Project Manager', 90000.00),
('Emily Johnson', 'HR Manager', 85000.00),
('Michael Brown', 'Data Scientist', 95000.00),
('Chris Wilson', 'Intern', 30000.00);
SELECT * FROM Employees;

# Added One new column in the table by using Alter and Add command And given the default values to the added column i.e. Active
ALTER TABLE Employees 
ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';
SELECT * FROM Employees;

# Updated the status column where EmployeeID=5
UPDATE Employees SET Status = 'Inactive' WHERE EmployeeID = 5;
SELECT * FROM Employees;

# Deleted the row where Status is Inactive
DELETE FROM Employees WHERE Status = 'Inactive';
SELECT * FROM Employees;

