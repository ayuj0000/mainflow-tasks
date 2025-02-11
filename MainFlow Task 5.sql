DROP DATABASE IF EXISTS studentmanagement;

-- Created a database named studentmanagemnt
CREATE DATABASE studentmanagement;
USE studentmanagement;

-- Created a table named Student_Scores with fields student_id, name, math_score, total_score
CREATE TABLE Student_Scores (student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
total_score INT, math_score INT, science_score INT);

-- Inserted the values in the table
INSERT INTO Student_Scores (total_score, math_score, science_score) 
VALUES 
(95, 45, 50), 
(85, 35, 60), 
(75, 40, 30), 
(65, 25, 20); 
SELECT * FROM Student_Scores;

-- Assign Grades to students based on their Total Scores
-- here we are using the case attribute to assign grades based on the following conditions 
-- it is like an if-else statement in python
SELECT student_id, total_score,
CASE
    WHEN total_score>=90 THEN 'A'
    WHEN total_score>=80 THEN 'B'
    WHEN total_score>=70 THEN 'C'
ELSE
    'D(fail)'
END AS grade 
FROM Student_Scores;

-- Identify Pass/Fail Status in Specific Subjects
-- here we are checking if a student is passed or failed in each subject by using the case statement
-- if any student has >=40 in each subject then he is considered as pass in that respective subject otherwise fail 
SELECT student_id, math_score,
CASE 
    WHEN math_score>=40 THEN 'pass' 
ELSE
    'fail'
END AS status,
science_score,
CASE 
    WHEN science_score>=40 THEN 'pass'
ELSE
    'fail'
END AS status
FROM Student_scores;





    