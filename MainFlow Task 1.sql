-- Created a database named StudentManagement.
CREATE DATABASE StudentManagement;
-- Create a table named Students with the following fields
CREATE TABLE Students (StudentID INT NOT NULL AUTO_INCREMENT, 
Name VARCHAR(50), Gender VARCHAR(1) NOT NULL, Age INT, Grade VARCHAR(10),
MathScore INT, ScienceScore INT, EnglishScore INT, PRIMARY KEY(StudentID));
-- Insert Data
INSERT INTO Students(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES('Ayuj', 'M', 20, 'B', 80, 60, 85),
('Ankit', 'M', 21, 'B', 75, 82, 90),
('Mona', 'F', 20, 'C', 60, 58, 70),
('Ayush', 'M', 22, 'C', 59, 60, 68),
('Anu', 'F', 19, 'A', 89, 90, 91),
('Laila', 'F', 20, 'B', 75, 79, 72),
('Akhil', 'M', 21, 'A', 90, 87, 92),
('Udit', 'M', 23, 'C', 60, 55, 72),
('Samit', 'M', 18, 'A', 92, 91, 98),
('Nancy', 'F', 19, 'B', 82, 75, 72);
-- Display all students and their details to get an overview of the data.
SELECT * FROM Students;
-- Calculate the average scores for each subject to understand subject-wise performance.
SELECT 
AVG(MathScore) as AvgMathScore,
Avg(ScienceScore) as AvgScienceScore,
Avg(EnglishScore) as AvgEnglishScore
FROM Students;
-- Find the student(s) with the highest total score across all subjects to identify the toppers
SELECT
StudentID, Name, Gender, Age, Grade, Mathscore, ScienceScore, EnglishScore
FROM Students WHERE (Mathscore+ScienceScore+EnglishScore)=(SELECT MAX(Mathscore+ScienceScore+EnglishScore) FROM Students);
-- Count the number of students in each grade to observe grade distributions.
SELECT Grade,
COUNT(*) as CountofStudents
FROM Students GROUP BY Grade;
-- Find average score for male and female students to compare performance by gender.
SELECT Gender, AVG(MathScore+ScienceScore+EnglishScore) as AvgScore FROM Students GROUP BY Gender;
-- Identify students whose Math score is above 80 to highlight high achievers in Math.
SELECT * FROM Students WHERE MathScore>80;
-- Update the grade of a student with specific Student ID to reflect changes or corrections.
UPDATE Students
SET Grade='A+'
WHERE StudentID=9;










