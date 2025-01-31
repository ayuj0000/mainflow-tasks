DROP DATABASE IF EXISTS studentmanagement;

-- Created a database named studentmanagemnt
CREATE DATABASE studentmanagement;
USE studentmanagement;

-- Created a table named Students with fields student_id, name, math_score, science_score, english_score, total_score
CREATE TABLE Students (student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(50), math_score INT, science_score INT, english_score INT,
total_score INT GENERATED ALWAYS AS (math_score + science_score + english_score) STORED);

-- Inserted the values in the table
INSERT INTO Students(name, math_score, science_score, english_score)
VALUES('Ayuj', 80, 60, 85),
('Ankit', 75, 82, 90),
('Mona', 60, 58, 70),
('Ayush', 59, 60, 68),
('Anu', 89, 90, 91),
('Laila', 75, 79, 72),
('Akhil', 90, 87, 92),
('Udit', 60, 55, 72),
('Samit', 92, 91, 98),
('Nancy', 82, 75, 72);
SELECT * FROM Students;

-- Query to identify Top 5 Students by total scores
-- Here we have used the ORDER BY attribute to rank students by their total scores in descending order
-- And then we used the LIMIT attribute to get only top firts 5 students
SELECT student_id, name, total_score FROM Students
ORDER BY total_score DESC
LIMIT 5;

-- Query to calculate the average score of students who scored above 70 in math
SELECT student_id, name,
(SUM(math_score+science_score+english_score)/3) AS average_score
FROM Students WHERE math_score>70
GROUP BY student_id;

-- Query to calculate the average total score of students grouped by students whose toatal score is between 200 to 250
SELECT AVG(total_score) 
FROM Students
WHERE 200<total_score<250;

-- Query to find Second-Highest Math Scores
-- here we have selected the maximum math score from the list of students where the max math score has been already excluded
-- by using the subquery
SELECT MAX(math_score) FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);









    



