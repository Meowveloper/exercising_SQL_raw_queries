-- Practising Comparison Operators

-- like operator
SELECT * 
FROM student
WHERE first_name LIKE 'D%';


-- Studnets Name ending with H
SELECT *
FROM student
WHERE last_name LIKE '%h'
LIMIT 2;


-- name starting with d end with n
SELECT * FROM student WHERE first_name LIKE 'D%n';

-- Select all the students whose last name begins with 'S'
SELECT * 
FROM student 
WHERE last_name LIKE 'S%';

-- select all the students whose last name begins with 'S' and whose first name begins with 'H'
SELECT *
FROM student
WHERE last_name LIKE 'S%'
AND first_name LIKE 'H%';


-- select all the students who are between the ages of 25 and 30
SELECT *
FROM student
WHERE age BETWEEN 25 AND 30;


-- select the first name and last name of all overseas students between 19 and 25 who do not have a course 
SELECT first_name AS "First Name", last_name AS "Last Name"
FROM student
WHERE age BETWEEN 19 AND 25
AND course_id IS NULL;


-- (IN operator) select the first and last names, and the course name, of all the students who are studying History or Geography
SELECT s.first_name AS "First Name", s.last_name AS "Last Name", c.course_name AS "Course"
FROM student AS s, course AS c
WHERE s.course_id=c.course_id
AND c.course_name IN ('History', 'Geography');


-- select the first name and last name, and the course name for all students studying History and Geography whose first name starts with the letter ‘H’
SELECT s.first_name AS "First Name", s.last_name AS "Last Name", c.course_name AS "Course"
FROM student AS s, course AS c
WHERE s.course_id=c.course_id
AND s.first_name LIKE 'H%'
AND c.course_name IN ('History', 'Geography');
