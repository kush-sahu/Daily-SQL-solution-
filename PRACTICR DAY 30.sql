 --52. List all the salesman in department number 30.
SELECT *
FROM SCOTT.EMP
WHERE DEPTNO=30 AND JOB='SALESMAN';

--  53. List all the salesman in department number 30 and
--  having salary greater than 5000.
SELECT *
FROM SCOTT.EMP
WHERE DEPTNO=30 AND JOB='SALESMAN' AND SAL>5000;
--  54. List all the employees whose ename starts with‘S’or‘A’.
SELECT *
from scott.emp 
WHERE ENAME LIKE 'A%' OR ENAME LIKE 'S%';

--  55. List all the employees except those who are working
--  in department number 10 and 20.
SELECT *
FROM SCOTT.EMP
WHERE DEPTNO NOT IN(10,20)
--  56. List all the employees who sename doesn’t start with ‘S’.
SELECT *
FROM SCOTT.EMP
WHERE ENAME NOT LIKE 'S%';
--  57. List all the employees who are having reporting
--  manager in department 10.
SELECT E.ENAME
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE M.DEPTNO=10;

--  58. Write a Query to display all the details of the
--  employee if their job is having one_(underscore)init.
SELECT *
FROM SCOTT.EMP
WHERE JOB LIKE '%\_%' ESCAPE '\';
--  59. Write a Query to dis play who are having % in their names.
SELECT *
FROM SCOTT.EMP 
WHERE ENAME LIKE '%\%%' ESCAPE '\'
--  60. Write a Query to display who are having_(underscore)
--  as second character in their name.
SELECT *
FROM SCOTT.EMP
WHERE ENAME LIKE '_\_%' ESCAPE '\';
--  61. Write a Query to display who are having at least2‘_’
--  in their name.
SELECT *
FROM SCOTT.EMP
WHERE ENAME LIKE '%\_%\_%' ESCAPE '\';
--  62. Write a Query to display all the employee who are
--  getting 2500 and exceED salaries’ in department number 20
SELECT ENAME
FROM SCOTT.EMP
WHERE SAL=2500 AND DEPTNO=20;
--  63. Write a Query to display all the manager working in
--  depart number 20 and 30.

SELECT ENAME, DEPTNO FROM SCOTT.EMP
WHERE EMPNO IN(SELECT MGR
             FROM SCOTT.EMP)
            AND DEPTNO IN(20,30)  ;  



SELECT M.ENAME,M.DEPTNO
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE M.DEPTNO IN(20,30);

-- 64. Write a Query to display all the employees whose job
--  is manger ,who don’t have reporting manager.
SELECT ename
FROM SCOTT.EMP
WHERE JOB='MANAGER' AND MGR IS NULL;

SELECT * FROM SCOTT.EMP;
--  65. Write a Query to display all the employee who are
--  getting some comm with their designation is neither
--  manager nor analyst.
SELECT ENAME,JOB
FROM SCOTT.EMP
WHERE COMM IS NOT NULL AND JOB NOT IN('MANAGER','ANALYST');
--  66. Write a Query to display all the manager whose annual
--  salary is ending with 0.
SELECT ENAME,SAL
FROM SCOTT.EMP
WHERE SAL*12 LIKE '%0';
--  67. Write a Query to display all The employee who are 
--  clerk and an aNAlyst with salary greater than 1000.
SELECT ENAME
FROM SCOTT.EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL>1000;
--  68. Write a Query to display all the employees having ‘E’
--  as the last but one character in employee name but salary
--  having at least 4 character.
SELECT ENAME,SAL
FROM SCOTT.EMP
WHERE ENAME LIKE '%E' AND SAL LIKE '____';
--  69. Write a Query to display all the employee who are
--  joinED after year81.
SELECT ENAME
FROM SCOTT.EMP
WHERE HIREDATE > '31-DEC-81';
--  70. Write a Query to display all the employees who are
--  joined in Feb.
select ENAME
FROM SCOTT.EMP
WHERE HIREDATE LIKE '%FEB%';
--  71. List the employee who are not working as manager
--  and clerk in depart no 10 and 20 with salary in the range
--  of 1000 to 3000.
SELECT ENAME
FROM SCOTT.EMP
WHERE JOB NOT IN('MANAGER','CLERK0') AND DEOTNO IN(10,20) AND SAL>=1000 AND SAL<=3000;
--  72. List the employees whose salary not in the range of
--  1000 to 2000 indepart no 10,20,30 except all salesman.
SELECT ENAMEY
FROM SCOTT.EMP
WHERE SAL NOT BETWEEN 1000 AND 2000 AND DEPTNO IN (10,20,30) AND JON NOT IN('SALESMAN');
--  73. List the depart names who are having letter ‘O’ in their
--  locations as well as their EMP names.
SELECT ENAME , DNAME, LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO 
WHERE LOC LIKE '%O%';
--  74. Write a Query to display all the employees whose job
--  has string ‘MAN’init.
SELECT ENAME
FROM SCOTT.EMP
WHERE JOB LIKE '%MAN%';
--  75. Write a Query to display all the details of employees
--  in descending order.
SELECT *
FROM SCOTT.EMP
ORDER BY EMPNO DESC;
--  76. Write a Query to display all the EMP name in
--  ascending order.
SELECT *
FROM SCOTT.EMP
ORDER BY EMPNO ;
-- 77. Write a Query to display the employee name in order
--  by clause salary for all the employee and display the
--  result in descending order of their annual salary.
SELECT ENAME,SAL
FROM SCOTT.EMP
ORDER BY SAL*12 DESC;
--  78. Write a Query to display ename and his salary and
--  display them according to hireddate.
SELECT ENAME,SAL
FROM SCOTT.EMP
ORDER BY HIREDATE;

--  79. Write a Query to display all the details of employee
--  who are neither salesman nor analyst salary should be
--  greater than 1000 in descending order for their departno.
SELECT *
FROM SCOTT.EMP
WHERE JOB NOT IN ('SALESMAN','ANALYST') AND SAL>1000
ORDER BY DEPTNO DESC;
--  80. Write a Query to display ename, manager, hireddate,
--  salary, new salary with hike 25% for all the employee
--  whose name does not star twith A or B short the result in
--  ascending order with new salary.
SELECT E.ENAME,M.ENAME,E.HIREDATE,E.SAL,E.SAL+E.SAL*25/100 AS NEWSAL
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE E.ENAME NOT LIKE 'A%' OR E.ENAME NOT LIKE 'B%'
ORDER BY NEWSAL ;
--  81. Write a Query to display departno and dname of All the
--  department and display in ascending order of their
--  location.
SELECT D.DNAME,DEPTNO
FROM SCOTT.DEPT D
ORDER BY D.LOC DESC;
--  82. Write a Query to display all the details of employee
--  only if the salary is not between 2000 and 3000orderby
--  their department number in ascending order, employee
--  number in ascending order.
SELECT *
FROM SCOTT.EMP
WHERE SAL NOT BETWEEN 2000 AND 3000
ORDER BY DEPT , EMPNO ASC;
--  83. Write a Query to display maximum salary ,minimum
--  salary and aVERage salary of the organization by 
--  excluding employees who is working as salesman.
SELECT MAX(SAL),MIN(SAL),AVG(SAL)
FROM SCOTT.EMP
WHERE JOB NOT LIKE 'SALESMAN';
--  84. Write a Query to display number of employees AND
--  their total salary who are working in department number
--  20,30.
SELECT COUNT(SAL) , SUM(SAL)
FROM SCOTT.EMP
WHERE DEPTNO IN(20,30);
--  85. Write a Query to display max salary, min salary only if
--  the name is start with A or S or M.
SELECT MAX(SAL),MIN(SAL)
FROM SCOTT.EMP
WHERE ENAME LIKE 'A' OR ENAME LIKE 'M';
--  86. WriteaQuerytodisplaynumberofemployeein
--  departmentnumber30workingassalesman.
SELECT COUNT(EMPNO)
FROM SCOTT.EMP
WHERE DEPTNP=30 AND JOB= 'SALESMAN';
-- 87. Write a Query to display average salary given to the
--  manager of the organization.
SELECT AVG(SAL)
FROM SCOTT.EMP
WHERE EMPNO IN(SELECT MGR
               FROM SCOTT.EMP
               WHERE MGR IS NOT NULL);
--  88. Write a query to display number of employee
--  department number 10 and number of employee in
--  department number 30.
SELECT COUNT(*),DEPTNO
FROM SCOTT.EMP
WHERE DEPTNO IN(10,30)
GROUP BY DEPTNO;
--  89. Write a Query to display total salary and average
--  salary for every department.
SELECT SUM(SAL),AVG(SAL),DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO;
--  90. Write a Query to display max sal and min sal in each
--  designation.
SELECT MAX(SAL),MIN(SAL),JOB
FROM SCOTT.EMP
GROUP BY JOB;
--  91. Write a Query to display total salary of every
--  department by excluding employee whose salary is
--  greater than 3000.
SELECT DNAME , SUM(SAL)
FROM SCOTT.EMP e inner join scott.DEPT d on e.deptno=d.deptno
WHERE e.SAL <=3000
GROUP BY DNAME;
-- 92 Write a query to display job-wise max salary in each department.
SELECT JOB,DEPTNO,maX(SAL)
FROM SCOTT.EMP
GROUP BY JOB,DEPTNO;
-- 93 Write a query to display department number of more than 4 employees.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY deptno
HAVING COUNT(*)>4;
-- 94 Write a query to display job-wise highest salary only if the highest salary is more than 1500.
SELECT JOB ,MAX(sAL)
FROM SCOTT.EMP
GROUP BY JOB 
HAVING MAX(sAL)>1500;
-- 95 Write a query to display job-wise highest salary only if the highest salary is more than 1500 excluding department number 30. Sort the database on highest salary in ascending order.
SELECT JOB ,MAX(sAL) AS SAL
FROM SCOTT.EMP
WHERE DEPTNO !=30
GROUP BY JOB 
HAVING MAX(sAL)>1500
ORDER BY SAL ;
-- 96 Write a query to display department number along with number of employees in it.
SELECT DEPTNO,COUNT(*)
FROM SCOTT.EMP
GROUP BY DEPTNO;
-- 97 Write a query to display the department number which are having more than 4 employees in them.
SELECT deptno
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING COUNT(*)>4;
-- 98 Write a query to display the max salary for each of the job excluding all the employees whose name ends with 'S'.
SELECT JOB,MAX(SAL)
FROM SCOTT.EMP
WHERE ENAME LIKE '%S'
GROUP BY JOB;
-- 99 Write a query to display the department number which are having more than 9000 as their departmental total salary.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY deptno
HAVING SUM(sAL)>9000;
--100 Write a query to display department-wise highest salary only if the highest salary is between 5000 and 10000 and total salary of department is below 10000.
SELECT DEPTNO,MAX(SAL)
FROM SCOTT.EMP
GROUP BY deptno
HAVING MAX(SAL) BETWEEN 5000 AND 10000 AND SUM(SAL)<10000;
--101 Write a query to display job-wise total salary in each department
-- only if department number 10, 20 total salary is less than 10000.
SELECT JOB,DEPTNO,SUM(SAL)
FROM SCOTT.EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM SCOTT.EMP
                WHERE DEPTNO IN(10,20)
                GROUP BY deptno
                HAVING SUM(sAL)<10000)
GROUP BY JOB,DEPTNO;

-- 102 Write a query to display average salary of each department by excluding all employees who do not have reporting manager.
SELECT DEPTNO , AVG(SAL)
FROM SCOTT.EMP
WHERE MGR IS NOT NULL
GROUP BY DEPTNO;

-- 103 Write a query to display max, min, cumulative, average, commission and salaries for all the departments which are having employees hired within 1980 and 1985.
SELECT DEPTNO,SUM(SAL),MAX(SAL),MIN(SAL),AVG(sAL)
FROM SCOTT.EMP
WHERE HIREDATE BETWEEN '01-JAN-80' AND '31-DEC-85'
GROUP BY DEPTNO ;
--104 Write a query to display max salary and total salary of each department
-- by considering all the employees whose job does not contain 
--'_' character in it and total salary of department should not be equal to
-- 5000 and should not be less than or equal to 9000.
SELECT DEPTNO , MAX(sAL),SUM(SAL)
FROM SCOTT.EMP
WHERE JOB NOT LIKE '%\_%' ESCAPE '\'
GROUP BY DEPTNO
HAVING SUM(SAL)!=5000 AND SUM(SAL)>9000;

--105 Write a query to display all the details of employee whose designation is same as Martin.
SELECT *
FROM SCOTT.EMP
WHERE JOB IN(SELECT JOB
             FROM SCOTT.EMP
             WHERE ENAME='MARTIN');
--106 Write a query to display all the employees who were hired after recruiting Miller.
SELECT *
FROM SCOTT.EMP
WHERE HIREDATE >(SELECT HIREDATE
                 FROM SCOTT.EMP
                 WHERE ENAME='MILLER');
-- 106 Write a query to display all the details of employee whose salary is greater than Adam’s salary and less than Scott’s salary.
SELECT *
FROM SCOTT.EMP
WHERE SAL>(SELECT SAL
           FROM SCOTT.EMP
           WHERE ENAME='ADAMS')
       AND SAL<(SELECT SAL
           FROM SCOTT.EMP
           WHERE ENAME='SCOTT')   ; 
-- 107 Write a query to display name of an employee along with the annual salary if the employee is working in Network.
SELECT ENAME, SAL*12
FROM SCOTT.EMP
WHERE DEPTNO IN(SELECT deptno 
                FROM SCOTT.DEPT
                WHERE DNAME='ACCOUNTING');
-- 108 Write a query to display all the details of employee who are working in same department of Smith or Allen.
SELECT *
FROM SCOTT.EMP
WHERE DEPTNO IN(SELECT deptno
                FROM SCOTT.EMP
                WHERE ENAME IN('ALLEN','SMITH'));
--109 List the employee whose salary is greater than Allen.
SELECT *
FROM SCOTT.EMP
WHERE SAL >(SELECT SAL
            FROM SCOTT.EMP
            WHERE ENAME='ALLEN');