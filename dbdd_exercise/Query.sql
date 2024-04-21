-- create database
CREATE DATABASE dbdd_exercise;


-- creating department table
CREATE TABLE department
(
	dept_no INTEGER NOT NULL, 
	dept_name VARCHAR(30), 
	location VARCHAR(20),
	PRIMARY KEY(dept_no)
);

-- creating worker table
CREATE TABLE worker
(
	emp_no INTEGER NOT NULL, 
	first_name VARCHAR(30), 
	last_name VARCHAR(30), 
	job_title VARCHAR(30), 
	age INTEGER, 
	dept_no INTEGER,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(dept_no) REFERENCES department(dept_no)
);

-- creating course table
CREATE TABLE course
(
	course_id INTEGER NOT NULL, 
	course_name VARCHAR(30), 
	PRIMARY KEY(course_id)
);


-- creating student table
CREATE TABLE student
(
	student_id INTEGER NOT NULL, 
	first_name VARCHAR(30), 
	last_name VARCHAR(30),
	student_type VARCHAR(20),
	course_id INTEGER,
	PRIMARY KEY(student_id),
	FOREIGN KEY(course_id) REFERENCES course(course_id)
);

-- inserting values into course table
INSERT INTO course VALUES
(1, 'Computing Science'), 
(2, 'History'),
(3, 'Geography');

-- inserting vaslues into student table
INSERT INTO student VALUES
(1, 'Pavel', 'Dobovitch', 'Home Student', 1),
(2, 'Winston', 'Kodogo', 'Overseas Student', 1), 
(3, 'Dawn', 'Cove', 'Overseas Student', 1), 
(4, 'Satpal', 'Singh', 'Home Student', 2), 
(5, 'Horace', 'Simth', 'Home Student', 3);

-- adding a new column to the student table
ALTER TABLE student
ADD age INTEGER;

-- reading the description or metadata of a table (checking if age column is added or not)
DESC student;


-- reading all data from the student table
SELECT * FROM student;

-- adding values to the age column of student table
UPDATE student
SET age=30
WHERE student_id=1;

UPDATE student
SET age=19
WHERE student_id=5;


-- selecting first name and last name of all students
SELECT first_name AS 'First Name', last_name AS 'Last Name' FROM student;

-- Selecting the names of all the courses ordered by the course name
SELECT course_name AS 'Course Name'
FROM course
ORDER BY course_name DESC;

-- Selecting the courses and the students that are in them
SELECT c.course_name AS 'Course Name', s.first_name AS 'First Name', s.last_name AS 'Last Name'
FROM course c, student s
WHERE c.course_id=s.course_id;

-- Selecting the last name and course name of all the overseas students
SELECT s.last_name AS 'Last Name of Student', c.course_name AS 'Name of the course he/she is attending', s.student_type AS 'Student Type'
FROM course c, student s
WHERE c.course_id=s.course_id
AND s.student_type='Overseas Student';

-- Showing the course data and names of all the students studying history
SELECT CONCAT(s.first_name, ' ', s.last_name) AS 'Student\'s Name', c.course_name
FROM course c, student s
WHERE c.course_id=s.course_id
AND c.course_name='History';

-- Select all the data for students over the age of 21
SELECT *
FROM student
WHERE age>21;


-- Select the first name, last name and age for students who are twenty one or over
SELECT first_name AS 'First Name', last_name AS 'Last Name', age AS 'Age'
FROM student
WHERE age>=21;

-- Select the first name, last name, course id and course name for students who are not studying Computing Science
SELECT s.first_name AS 'First Name', s.last_name AS 'Last Name', c.course_name AS 'Course Name'
FROM student s, course c
WHERE s.course_id=c.course_id
AND c.course_name <> 'Computing Science';

-- Select all the details for the students under 30 who are studying computer science
SELECT s.*
FROM student s, course c
WHERE s.course_id=c.course_id
AND s.age<30
AND c.course_name<> 'Computing Science';

-- Show the first names for students studying Computing Science who are not Home Students
SELECT s.first_name AS 'First Name of the Student'
FROM student s, course c
WHERE s.course_id=c.course_id
AND c.course_name = 'Computing Science'
AND s.student_type <> 'Home Student';