create database university;
use university;
create table students(student_id int Primary Key, first_name varchar(50), last_name varchar(50), date_of_birth date, major varchar(50));
create table courses(course_id int Primary Key, course_name varchar(50), credits int);
create table enrollments(enrollment_id int, enrollment_date date, student_id int, course_id int, Foreign key(student_id) references students (student_id), Foreign Key(course_id) references courses (course_id));
describe students;
describe courses;
describe enrollments;
drop table enrollments;
select*from enrollments;
select*from courses;
select*from students;
SELECT * FROM Students WHERE major = 'Computer Science';
SELECT s.major, AVG(c.credits) AS avg_credits FROM Students s JOIN Enrollments e ON s.student_id = e.student_id JOIN Courses c ON e.course_id = c.course_id GROUP BY s.major;
SELECT first_name, last_name FROM Students WHERE student_id NOT IN (SELECT student_id FROM Enrollments);
SELECT c.course_name, COUNT(e.student_id) AS num_students FROM Courses c LEFT JOIN Enrollments e ON c.course_id = e.course_id GROUP BY c.course_id, c.course_name;
SELECT s.student_id, s.first_name, s.last_name, COUNT(e.course_id) AS num_courses FROM Students s JOIN Enrollments e ON s.student_id = e.student_id GROUP BY s.student_id 
HAVING COUNT(e.course_id) = (SELECT MAX(course_count)FROM(SELECT COUNT(course_id) AS course_count FROM Enrollments GROUP BY student_id) AS counts );
SELECT s.student_id, s.first_name, s.last_name, SUM(c.credits) AS total_credits FROM Students s JOIN Enrollments e ON s.student_id = e.student_id JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.student_id;
SELECT c.course_name, COUNT(e.student_id) AS num_students FROM Courses c JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name HAVING COUNT(e.student_id) > 10;
SELECT s.student_id, s.first_name, s.last_name, SUM(c.credits) AS total_credits FROM Students s JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id GROUP BY s.student_id HAVING SUM(c.credits) = (SELECT MAX(total_credits) FROM (SELECT SUM(c.credits) AS total_credits
FROM Enrollments e JOIN Courses c ON e.course_id = c.course_id GROUP BY e.student_id) AS subquery);
SELECT *  FROM Students WHERE date_of_birth < '2000-01-01';
SELECT * FROM Courses WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);
SELECT c.course_name, COUNT(e.student_id) AS num_students FROM Courses c LEFT JOIN Enrollments e ON c.course_id = e.course_id GROUP BY c.course_id, c.course_name
ORDER BY num_students DESC;
SELECT *  FROM Students WHERE date_of_birth = (SELECT MAX(date_of_birth) FROM Students);
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE s.student_id IN (
    SELECT e1.student_id
    FROM Enrollments e1
    JOIN Courses c1 ON e1.course_id = c1.course_id
    WHERE c1.course_name = 'Introduction to CS'
)
AND s.student_id IN  
    SELECT e2.student_id
    FROM Enrollments e2
    JOIN Courses c2 ON e2.course_id = c2.course_id
    WHERE c2.course_name = 'Data Structures'
);
SELECT * FROM Courses  WHERE credits > (SELECT AVG(credits) FROM Courses);
SELECT s.student_id, s.first_name, s.last_name, COUNT(e.course_id) AS num_enrollments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING COUNT(e.course_id) = (
    SELECT MAX(course_count)
    FROM (
        SELECT COUNT(course_id) AS course_count
        FROM Enrollments
        GROUP BY student_id
    ) AS counts
);
SELECT s.major, SUM(c.credits) AS total_credits FROM Students s JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id GROUP BY s.major;
SELECT first_name, last_name  FROM Students WHERE student_id NOT IN (SELECT student_id FROM Enrollments);
SELECT * FROM Courses WHERE credits = (SELECT MAX(credits) FROM Courses);
SELECT * FROM Courses WHERE credits = (SELECT MIN(credits) FROM Courses);
SELECT c.course_name, e.enrollment_date FROM Enrollments e JOIN Courses c ON e.course_id = c.course_id WHERE e.enrollment_date = (
SELECT MAX(enrollment_date) FROM Enrollments);
SELECT AVG(DATEDIFF(CURRENT_DATE, date_of_birth) / 365.25) AS average_age FROM Students;



















