DROP DATABASE IF EXISTS studentmanagement;

-- Created a database named studentmanagemnt
CREATE DATABASE studentmanagement;
USE studentmanagement;

-- Created a table named Students with fields student_id, name, math_score, total_score
CREATE TABLE Students (student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(50), math_score INT, total_score INT);

-- Inserted the values in the table
INSERT INTO Students(name, math_score, total_score)
VALUES('Ayuj', 80, 245),
('Ankit', 75, 200),
('Mona', 60, 198),
('Ayush', 59, 202),
('Anu', 89, 180),
('Laila', 75, 195),
('Akhil', 90, 202),
('Udit', 60, 190),
('Samit', 92, 250),
('Nancy', 82, 241);
SELECT * FROM Students;

-- Query to Rank Students Based on their Total Scores
-- Here we are using RANK() function to assign ranks to students based on their Total Score
-- If two students have the same score, they receive the same rank, and the next rank is skipped
SELECT student_id, name, RANK() OVER (ORDER BY total_score DESC) FROM Students;

-- Query to Calculate Running Totals for Math Scores
-- Here we are using SUM() function with OVER() function to calculate running totals math scores ordered by student id
SELECT student_id, name, SUM(math_score) OVER (ORDER BY student_id) FROM Students;
