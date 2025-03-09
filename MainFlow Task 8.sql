# created a database student_management and using it through USE command
CREATE DATABASE student_management;
USE student_management;

-- Created a table named Students with fields student_id, name, math_score, total_score
CREATE TABLE Students (student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(50), math_score INT, total_score INT, grade CHAR(2));

-- Inserted the values in the table
INSERT INTO Students(name, math_score, total_score, grade)
VALUES('Ayuj', 80, 245, 'A'),
('Ankit', 74, 199, 'C'),
('Mona', 60, 198, 'C'),
('Ayush', 59, 202, 'B'),
('Anu', 89, 180, 'C'),
('Laila', 75, 195, 'C'),
('Akhil', 90, 202, 'B'),
('Udit', 60, 190, 'C'),
('Samit', 92, 250, 'A+'),
('Nancy', 82, 241, 'A');
SELECT * FROM Students;

# created a table named Backup with attributes same as of table Students.
# the previous data from table Students will get stored in this table after table Students record changed 
CREATE TABLE Backup (student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(50), math_score INT, total_score INT);

# created a trigger which get triggerd when we want to update some record in the table Students
# and store the previous data from Students in the table Backup after updation
DELIMITER $$

CREATE TRIGGER T1
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
  INSERT INTO Backup(student_id, name, math_score, total_score)
  VALUES (OLD.student_id, OLD.name, OLD.math_score, OLD.total_score);
END

$$ DELIMITER ;

# here we are updating the table students and as we update the table the Trigger which we had created get triggered 
UPDATE Students
SET math_score = 80, total_score = 205, grade='B'
WHERE student_id = 2;

SELECT * FROM Students;

SELECT * FROM Backup;

# here we are updating the table students and as we update the table the Trigger which we had created get triggered 
UPDATE Students
SET math_score = 60, total_score = 203
WHERE student_id = 4;

SELECT * FROM Students;

SELECT * FROM Backup;

 
DELIMITER //

# here we have created an procedure which is used to execute any one query multiple times by just calling it
# In simple words you can say that It is a type of function 
# here below we have created a procedure named UpdateStudentGrades which contain a query to Update the rows of the Table Students
CREATE PROCEDURE UpdateStudentGrades()
BEGIN
    UPDATE Students
    SET grade = 
        CASE
            WHEN total_score >= 240 THEN 'A+'
            WHEN total_score >= 200 THEN 'A'
            WHEN total_score >= 180 THEN 'B'
            WHEN total_score >= 150 THEN 'C'
            WHEN total_score >= 60 THEN 'D'
            ELSE 'F'
        END;
END 

// DELIMITER ;

# here we are calling the procedure UpdateStudentGrades()
CALL UpdateStudentGrades();
 

