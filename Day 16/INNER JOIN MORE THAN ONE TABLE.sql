-- select * from student;

-- set sql_safe_updates =0;
-- delete   from student 
-- where sname='kush';

-- Q1  1. Show student names along with the companies they got placed in. 
SELECT SNAME,COMPANY
FROM student inner join placement
on student.studId=placement.studId;

-- Q2. List students and their attendance status for June 10, 2025. 
SELECT SNAME,STATUC
FROM STUDENT INNER JOIN ATTENDANCE
ON student.STUDiD=ATTENDANCE.STUDiD;

-- Q3. Display students who have paid fees with payment mode details.
SELECT *
FROM STUDENT INNER JOIN FEES
ON student.STUDID=FEES.STUDID
WHERE MODEOFPAYMENT != "CASH";

-- 	Q4. Show students who got placed along with their fee payment details.
SELECT *
FROM (STUDENT INNER JOIN PLACEMENT
ON STUDENT.STUDID=PLACEMENT.STUDID)INNER JOIN FEES
ON FEES.STUDID=student.STUDID;

-- Q5  List students with their attendance on June 10, 2025, and also show how much fee they have paid. 
SELECT SNAME ,STATUC,AMOUNT
FROM (student INNER JOIN ATTENDANCE
ON STUDENT.STUDID=ATTENDANCE.STUDID) INNER JOIN FEES
ON STUDENT.STUDID=FEES.STUDID
WHERE ATTEND_DATE='2025-06-11';

-- Q6. Show names of placed students along with their course and salary. 
SELECT SNAME,COURSE,SALARY
FROM (STUDENT INNER JOIN PLACEMENT
ON student.studId=PLACEMENT.STUDID);

-- Q7. Show complete details of students who are placed,
-- have attendance record, and have paid fees.
SELECT *
FROM ((STUDENT INNER JOIN PLACEMENT
ON STUDENT.STUDID=PLACEMENT.STUDID)INNER JOIN ATTENDANCE 
 ON STUDENT.STUDID=ATTENDANCE.STUDID)INNER JOIN FEES
 ON student.STUDID=FEES.STUDID;
 
 -- Q8 . List names of students who were present on June 10, 2025,
 -- got placed, and paid more than Rs.15,000 fees.
 SELECT SNAME
 WHERE ((STUDENT INNER JOIN ATTENDANCE 
 ON STUDENT.STUDID=ATTENDANCE.STUDID) INNER JOIN PLACEMENT
 ON STUDENT.STUDID=PLACEMENT.STUDID) INNER JOIN FEES
 ON STUDENT.STUDID=FEES.STUDID
 WHERE ATTENS_DATE='25-06-10' AND AMOUNT>15000;