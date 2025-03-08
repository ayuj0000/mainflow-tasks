-- created database student_management and using it by USE command
CREATE DATABASE student_management;
USE student_management;

-- created table Students with StudentID as primary key
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Grade INT
);

-- inserted the values in the table Students
INSERT INTO Students (StudentID, Name, Age, Grade) VALUES
(1, 'Ayuj', 14, 9),
(2, 'Ankit', 15, 10),
(3, 'Mona', 14, 9),
(4, 'Ayush', 16, 11),
(5, 'Anu', 15, 10);
SELECT * FROM Students;

-- created table Scores with ScoreID as Primary key and StudentID from table Students as Foreign key
CREATE TABLE Scores (
    ScoreID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(50),
    Score INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Inserted the values in the table Scores
INSERT INTO Scores (ScoreID, StudentID, Subject, Score) VALUES
(1, 1, 'Math', 85),
(2, 1, 'English', 90),
(3, 2, 'Math', 78),
(4, 2, 'English', 88),
(5, 3, 'Math', 92),
(6, 3, 'English', 81),
(7, 4, 'Math', 76),
(8, 4, 'English', 85),
(9, 5, 'Math', 89),
(10, 5, 'English', 87);
SELECT * FROM Scores;

-- Created a view Student_Scores with columns from the Two tables i.e. Students and Scores. 
-- This Columns are StudentID and Name From table Students(s) in the below query and Subject and Score from table Scores(sc)
-- we had joined the two tables as the two tables are connected by an atrribute which is StudentID
CREATE VIEW Student_Scores AS  
SELECT s.StudentID, s.Name, sc.Subject, sc.Score  
FROM Students s  
JOIN Scores sc ON s.StudentID = sc.StudentID;

SELECT * FROM Student_scores;

-- Created a view passed_students with columns StudentID and Name from table Students
-- with the condition that StudentID of those students with score less than 40 in any subject will not be selected 
CREATE VIEW passed_students AS  
SELECT StudentID, Name  
FROM Students  
WHERE StudentID NOT IN ( 
SELECT StudentID FROM Scores WHERE Score < 40 
); 

SELECT * FROM passed_students;

