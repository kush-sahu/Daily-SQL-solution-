use school;

select * from timetable;

CREATE TABLE STUDENT(
NAME VARCHAR(100),
AGE CHAR(20),
CLASS CHAR(40)
);

select * from student;

SET sql_safe_updates = 0;
DELETE FROM student;