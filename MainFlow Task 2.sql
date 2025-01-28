-- Drop Database if it already exists
DROP DATABASE IF EXISTS StudentManagement;

-- Create Database
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- Create Students Table
CREATE TABLE Students (
    StudentID INT NOT NULL AUTO_INCREMENT, 
    Name VARCHAR(50), 
    Gender VARCHAR(1) NOT NULL, 
    Age INT, 
    Grade VARCHAR(10), 
    MathScore INT, 
    ScienceScore INT, 
    EnglishScore INT, 
    PRIMARY KEY(StudentID)
);

-- Create Courses Table
CREATE TABLE Courses (
    Course_id INT NOT NULL PRIMARY KEY, 
    Course_name VARCHAR(50), 
    Course_description VARCHAR(255)
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
    enrollment_id INT NOT NULL PRIMARY KEY, 
    student_id INT NOT NULL,
    course_id INT NOT NULL, 
    enrollment_date DATE, 
    FOREIGN KEY(student_id) REFERENCES Students(StudentID), 
    FOREIGN KEY(course_id) REFERENCES Courses(Course_id)
);

-- Insert Data into Students Table
INSERT INTO Students(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Ayuj', 'M', 20, 'B', 80, 60, 85),
('Ankit', 'M', 21, 'B', 75, 82, 90),
('Mona', 'F', 20, 'C', 60, 58, 70),
('Ayush', 'M', 22, 'C', 59, 60, 68),
('Anu', 'F', 19, 'A', 89, 90, 91),
('Laila', 'F', 20, 'B', 75, 79, 72),
('Akhil', 'M', 21, 'A', 90, 87, 92),
('Udit', 'M', 23, 'C', 60, 55, 72),
('Samit', 'M', 18, 'A', 92, 91, 98),
('Nancy', 'F', 19, 'B', 82, 75, 72);

-- Insert Data into Courses Table
INSERT INTO Courses(Course_id, Course_name, Course_description)
VALUES
(101, 'Maths', 'This is a course in which you will learn mathematics'),
(102, 'Science', 'This course will teach you about science'),
(103, 'English', 'This course covers the basics of English'),
(104, 'IP', 'In this course, you will learn about Information Practices');

-- Insert Data into Enrollment Table
INSERT INTO Enrollment (enrollment_id, student_id, course_id, enrollment_date)
VALUES 
(1, 1, 101, '2025-01-01'),
(2, 2, 102, '2025-01-02'),
(3, 3, 103, '2025-01-03'),
(4, 4, 104, '2025-01-04'),
(5, 5, 101, '2025-01-05'),
(6, 6, 102, '2025-01-06'),
(7, 7, 103, '2025-01-07'),
(8, 8, 104, '2025-01-08'),
(9, 9, 101, '2025-01-09'),
(10, 10, 102, '2025-01-10');

SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Enrollment;
-- Query used to list all the students and the courses they are enrolled in. In this we use Inner join to combine 
-- Students, Courses, and Enrollments tables
SELECT 
    Students.Name AS StudentName,
    Courses.Course_name AS CourseName
FROM 
    Enrollment
INNER JOIN Students
    ON Enrollment.student_id = Students.StudentID
INNER JOIN Courses
    ON Enrollment.course_id = Courses.Course_id;
-- Query to find the number of students enrolled in each course. Here we use Left join to connect Courses and enrollments tables
-- and then using Group by to group results by course id and course name and then used count to calculate the number of enrolled students.
SELECT 
    Courses.Course_id AS CourseID,
    Courses.Course_name AS CourseName,
    COUNT(Enrollment.student_id) AS NumberOfStudents
FROM 
    Courses
LEFT JOIN Enrollment
    ON Courses.Course_id = Enrollment.course_id
GROUP BY 
    Courses.Course_id, Courses.Course_name;
-- Query used to list students who have enrolled in more than one course. here we only use enrollments table and grouping the table data
-- by student id and then use count to calculate the number of courses per student per student
SELECT 
    Enrollment.student_id AS StudentID,
    COUNT(Enrollment.course_id) AS NumberOfCourses
FROM 
    Enrollment
GROUP BY 
    Enrollment.student_id
HAVING 
    COUNT(Enrollment.course_id) > 1;
-- Query to find courses with no enrolled students
SELECT 
    Courses.Course_id AS CourseID,
    Courses.Course_name AS CourseName
FROM 
    Courses
LEFT JOIN Enrollment
    ON Courses.Course_id = Enrollment.course_id
WHERE 
    Enrollment.enrollment_id IS NULL;

    

    
    


















