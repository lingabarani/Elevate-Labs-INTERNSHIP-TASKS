create database companyDB;
use companyDB;
create table Employee(EMP_ID int, EMP_NAME varchar(20), EMP_AGE int, EMP_SALARY int, EMP_DEPARTMENT varchar(20));
describe Employee;
insert into Employee values(1, 'John Doe', 28, 50000.00, 'IT'),
(2, 'Jane Smith', 35, 60000.00, 'Marketing'),
(3, 'Robert Johnson', 22, 45000.00, 'Finance'),
(4, 'Emily Davis', 29, 55000.00, 'Sales'),
(5, 'Michael Brown', 32, 70000.00, 'IT'),
(6, 'Amanda White', 26, 48000.00, 'Operations'),
(7, 'Brian Taylor', 40, 80000.00,'Finance'),
(8, 'Jessica Miller', 27, 52000.00, 'Marketing'),
(9, 'Daniel Harris', 33, 65000.00, 'IT'),
(10, 'Olivia Martinez', 31, 60000.00, 'Sales'),
(11, 'Matthew Wilson', 28, 55000.00, 'Operations'),
(12, 'Sophia Rodriguez', 36, 75000.00, 'Marketing'),
(13, 'Ethan Anderson', 24, 48000.00, 'IT'),
(14, 'Madison Lee', 29, 52000.00, 'Sales'),
(15, 'Liam Thomas', 45, 90000.00, 'Finance'),
(16, 'Isabella Turner', 30, 58000.00, 'Operations'),
(17, 'Mason Baker', 29, 53000.00, 'IT'),
(18, 'Ava Turner', 34, 68000.00, 'Sales'),
(19, 'Logan Hill', 26, 47000.00, 'Marketing'),
(20, 'Harper Scott', 31, 60000.00, 'Operations'),
(21, 'Carter Phillips', 35, 70000.00, 'IT'),
(22, 'Evelyn Murphy', 28, 54000.00, 'Sales'),
(23, 'Jackson Carter', 32, 65000.00, 'Finance'),
(24, 'Emma Lewis', 25, 50000.00, 'IT'),
(25, 'Lucas Adams', 38, 75000.00, 'Operations'),
(26, 'Penelope Parker', 27, 52000.00, 'Marketing'),
(27, 'Grayson Wood', 30, 60000.00, 'Sales'),
(28, 'Scarlett Reed', 29, 57000.00, 'Finance'),
(29, 'Caleb Price', 33, 68000.00, 'IT'),
(30, 'Hazel Cooper', 31, 62000.00, 'Operations'),
(31, 'Elijah Fisher', 40, 80000.00, 'Marketing'),
(32, 'Grace Mitchell', 23, 46000.00, 'Sales'),
(33, 'Bentley Turner', 29, 53000.00, 'IT'),
(34, 'Zoe Hernandez', 37, 72000.00, 'Finance'),
(35, 'Leo Foster', 28, 55000.00, 'Operations'),
(36, 'Luna Watson', 30, 59000.00, 'Marketing'),
(37, 'Hudson Russell', 26, 49000.00, 'IT'),
(38, 'Aria Diaz', 32, 66000.00, 'Sales'),
(39, 'Landon Evans', 29, 54000.00, 'Finance'),
(40, 'Nova Ward', 33, 68000.00, 'Operations'),
(41, 'Braxton Foster', 27, 51000.00, 'Marketing'),
(42, 'Mila Bryant', 30, 58000.00, 'IT'),
(43, 'Owen Martinez', 35, 70000.00, 'Sales'),
(44, 'Addison Bell', 29, 52000.00, 'Operations'),
(45, 'Eli Perry', 31, 61000.00, 'Finance'),
(46, 'Stella Green', 28, 56000.00, 'IT'),
(47, 'Zachary Taylor', 34, 67000.00, 'Marketing'),
(48, 'Natalie Price', 25, 48000.00, 'Sales'),
(49, 'Cooper Wright', 36, 72000.00, 'Finance'),
(50, 'Lily Sanders', 29, 55000.00, 'Operations');
select*from Employee;
select * from Employee where EMP_DEPARTMENT = 'Marketing';
select distinct EMP_AGE, EMP_SALARY from employee;
SELECT EMP_NAME, EMP_AGE, EMP_DEPARTMENT FROM Employee WHERE ((EMP_DEPARTMENT = 'IT' AND EMP_AGE < 30) OR (EMP_DEPARTMENT = 'Finance'));
select * from employee where EMP_SALARY between 40000 and 60000;
select * from employee where EMP_DEPARTMENT in ('HR', 'Operations');
select *from employee where EMP_NAME like 'j%';
select EMP_SALARY from employee order by EMP_SALARY desc;
Select min(EMP_AGE) from employee;
Select max(EMP_AGE) from employee;
select avg(EMP_SALARY) from employee;
select count(EMP_SALARY) from employee where EMP_DEPARTMENT = 'Administration';
select count(EMP_SALARY) from employee where EMP_DEPARTMENT = 'Finance';
alter table employee add column (emp_location varchar(50));
describe employee;
alter table employee rename column emp_department to emp_dept;
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

