CREATE TABLE student_type
(student_type VARCHAR(20) NOT NULL);

INSERT INTO student_type(student_type) VALUES
("Home Student" ), 
("Overseas Student");

ALTER TABLE student_type
ADD fee INT NOT NULL;

ALTER TABLE student_type
ADD PRIMARY KEY(student_type);

ALTER TABLE student
ADD FOREIGN KEY(student_type) REFERENCES student_type(student_type);


SELECT * FROM student_type;


UPDATE student_type
SET fee=5000
WHERE student_type="Home Student";


SELECT s.first_name AS "First Name", s.last_name AS "Last Name", s.student_type AS "Student Type", st.fee AS "Fees"
FROM student s, student_type st
WHERE s.student_type=st.student_type;

-- ------------------------------------------------------------------------

-- counting the numbe of students in each course
SELECT c.course_name AS "Course Name", COUNT(s.student_id) AS "Number of Students"
FROM student s, course c
WHERE s.course_id=c.course_id
GROUP BY c.course_id
HAVING COUNT(s.student_id)>1;


-- reading oldest student
SELECT first_name, last_name, age
FROM student
WHERE age= (SELECT MAX(age) FROM student);


-- sub-query to show the first name of the oldest oversea student
SELECT first_name AS "First Name" , age
FROM student
WHERE age = (SELECT MAX(age) FROM student WHERE student_type="Overseas Student");


-- counting the students older than age 30
SELECT COUNT(student_id) AS "Number of Students Older Than 30"
FROM student
WHERE age>=30;


SELECT c.course_name, AVG(s.age) AS "Average Age of Student"
FROM student s, course c
WHERE s.course_id=c.course_id
GROUP BY c.course_id;


-- high complexity i think
SELECT SUM(st.fee) AS "Total Amount", st.student_type AS "Student Type"
FROM student s, student_type st
WHERE s.student_type=st.student_type
GROUP BY st.student_type
ORDER BY SUM(st.fee) DESC
LIMIT 1;

-- total amount given by the oversea students
SELECT SUM(st.fee) AS "Total Amount given by Overseas Studnets"
FROM student s, student_type st
WHERE s.student_type=st.student_type
AND s.student_type="Overseas Student";

-- which course is the most profitable
SELECT c.course_name AS "course name", SUM(st.fee) AS "Total Amount of Fee"
FROM student s, student_type st, course c
WHERE s.student_type=st.student_type
AND c.course_id=s.course_id
GROUP BY c.course_id
ORDER BY SUM(st.fee) DESC
LIMIT 1;


SELECT AVG(st.fee) AS "Average Fee"
FROM student s, student_type st
WHERE s.student_type=st.student_type
AND s.age>20;


-- fees given by the youngest student
SELECT CONCAT(s.first_name,' ', s.last_name) AS "Name", s.age, st.fee
FROM student s, student_type st
WHERE s.student_type=st.student_type
AND s.age = (SELECT MIN(age) FROM student);



