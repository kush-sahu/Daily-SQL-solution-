--125. Write a Query to display the third maximum salary. 
SELECT SAL
FROM (
SELECT SAL ,ROWNUM R
FROM SCOTT.EMP)
WHERE R=3;

-- 126. Write a Query to display all the employees who are
-- earning more than all the managers.
SELECT ENAME
FROM SCOTT.EMP
WHERE SAL>ALL(SELECT SAL
              FROM SCOTT.EMP
              WHERE EMPNO IN(SELECT DISTINCT MGR
                             FROM SCOTT.EMP
                             WHERE MGR IS NOT NULL));
-- 127. Write a Query to display all the employees who are
-- earning more than any of the managers.
SELECT ENAME
FROM SCOTT.EMP
WHERE SAL>ANY(SELECT SAL
              FROM SCOTT.EMP
              WHERE EMPNO IN(SELECT MGR
                             FROM SCOTT.EMP));
-- 128. Select empno, job and salary of all the analyst who are
-- earning more than any of the manager.
select  EMPNO, JOB,SAL
FROM SCOTT.EMP 
WHERE JOB='ANALYS' AND SAL>ANY (SELECT SAL
              FROM SCOTT.EMP
              WHERE EMPNO IN(SELECT MGR
                             FROM SCOTT.EMP));

-- 129. Select the department name and location of all the
-- employee working for clark.
SELECT DNAME,LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE E.MGR IN(SELECT EMPNO
               FROM SCOTT.EMP
               WHERE ENAME='CLARK');

-- 130. Write a Query to display ename, empno, and his
--dname and loc and also his annual salary for all the
--employees, who are working as salesman or dark in loc,
--New York or Chicago or Boston.
SELECT E.ENAME,E.EMPNO,D.DNAME,D.LOC,E.SAL*12 AS ANNUAL_SAL
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE JOB IN('SALESMAN','CLARK') AND LOC IN('NEW YORK','CHICAGO','BOSTON');
--131. Write a Query to display empno, sal with the hike of
--35% his department name, location and departno of the
--employee whose salary is greater than Allen’s salary and
--he should be working in either NEWYORK or
-- CHICACO.
SELECT ENAME,SAL,SAL+SAL*35/100 AS "35% HIKE",D.DNAME,LOC,D.DEPTNO
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D 
ON E.DEPTNO = D.DEPTNO
WHERE SAL>(SELECT SAL
           FROM SCOTT.EMP
           WHERE ENAME='ALLEN')
      AND LOC IN('NEW YORK','CHICAGO');    

-- 132. Write a Query to display to display Ename, Dname
--only if the Dname is having atleast one ‘O’ of the name
----of the employee is having ‘E’ as the second last
--character.
SELECT ENAME,DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON D.DEPTNO=E.DEPTNO
WHERE DNAME LIKE '%O%' AND ENAME LIKE '%E_'
-- 133. Display Ename, JOB, Dname, loc of all the Managers
-- and clerks who are working in accounts and sales
-- department.
SELECT ENAME,JOB,DNAME,LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON D.DEPTNO=E.Deptno
WHERE JOB IN('MANAGER','CLERK') AND DNAME='SALES';
--134. Display Ename, sal, Dname of all the salesman who
-- are not located at DALLAS.
SELECT ENAME,SAL,DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON D.DEPTNO=E.DEPTNO
WHERE DNAME='DALLAS' AND JOB='SALESMAN';
--135. Write a Query to display Ename,Dname only if the
--department name having atleast one ‘O’ or the name of
--the employee is having ‘E’ as the second last character.
select ENAME,DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE DNAME LIKE '%O%' AND ENAME LIKE '%E_%';

--136. Display Ename, job,Dname, Loc of all the managers
--and clerks who works in accounts and sales department.
SELECT ENAME,DNAME,JOB,LOC 
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO 
WHERE JOB IN('MANAGER','CLERKS');
--137. Display Ename,Sal, and Dname of all the salesman
--who are not located at the last.
SELECT ENAME,SAL,DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE JOB='SALESMAN' AND E.DEPTNO NOT IN(SELECT DEPTNO 
                                        FROM (SELECT DEPTNO,ROWNUM AS R
                                              FROM SCOTT.DEPT
                                              ORDER BY R DESC)
                                        WHERE ROWNUM<=1   
                                        )
-- 138. SELECT Ename and location of all the employees
-- who work in DALLAS.
SELECT ENAME,LOC,DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE LOC='DALLAS';
                                        )
--139. Select Ename, Dname and location of all the
--employees who are working for clerk.
SELECT ENAME,DNAME,LOC
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE E.MGR IN (SELECT EMPNO
                FROM SCOTT.EMP
                WHERE ENAME='CLARK');
--140. Select Ename, job, Departmental information for all
--the actual manager.

SELECT ENAME,JOB,D.*
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO;

-- 141. Write a Query to display employee who is not working
-- in any department.
SELECT *
FROM SCOTT.EMP E LEFT OUTER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE D.DEPTNO IS NULL;

--142. Write a Query to display the number of department
--which has employees.
SELECT COUNT(*) AS "NO OF DEPT"
FROM(
SELECT E.DEPTNO AS DENO
FROM SCOTT.EMP E RIGHT OUTER JOIN SCOTT.DEPT D
ON D.DEPTNO=E.DEPTNO
GROUP BY E.DEPTNO
)
WHERE DENO IS NOT NULL;


--143. Write a Query to display the number of departments
--which don’t have employees.
SELECT COUNT(*)
FROM (
SELECT D.DNAME,COUNT(E.EMPNO) AS "NO OF E"
FROM SCOTT.EMP E RIGHT OUTER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
GROUP BY D.DNAME)
WHERE "NO OF E"=0;
--144. Write a Query to display Dname which is having
--atleast one employee in it.
SELECT D.DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
GROUP BY D.DNAME;
--145. Write a Query to display Dname which has no
--employees.
SELECT DNAME
FROM (
SELECT DNAME,COUNT(ENAME) AS "NO OF E"
FROM SCOTT.EMP E RIGHT OUTER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
GROUP BY DNAME)
WHERE "NO OF E"=0;
--146. Display the names of the reporting manager who don’t
--have a reporting manager.
SELECT DISTINCT M.ENAME
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO 
WHERE M.MGR IS NULL;
--147. Write a Query to display who is having atleast 2
--reporting manager.
ANS FOR THIS QUESTION IS NOT POSSIBLE BECAUSE 1 EMP HAVE ONLY 1 MGR
--Find the managers who are reporting managers for at least 2 employees
SELECT M.ENAME
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
GROUP BY M.Ename
HAVING COUNT(*)>=2;
--148. Write a Query to display Dname which is having
--employeeS hired on the same date.
SELECT DISTINCT DNAME
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO =D.Deptno
WHERE E.HIREDATE IN(SELECT E.HIREDATE
                    FROM SCOTT.EMP E1 INNER JOIN SCOTT.DEPT D1
                    ON E1.DEPTNO =D1.Deptno
                    WHERE D1.DNAME=D.DNAME AND E1.ENAME!=E.ENAME
                    );
--149. Write a Query to display who is hired after Smith and
--his department should have more than 4 employees.
SELECT Ename
FROM SCOTT.EMP E INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE HIREDATE >(SELECT HIREDATE
                 FROM SCOTT.EMP
                 WHERE ENAME='SMITH') 
     AND E.DEPTNO IN(SELECT D1.DEPTNO 
                   FROM SCOTT.EMP E1 INNER JOIN SCOTT.DEPT D1
                   ON E1.DEPTNO=D1.DEPTNO
                   GROUP BY D1.DEPTNO
                   HAVING COUNT(E1.ENAME)>4);
--150. Write a Query to display Ename, his manager name.
SELECT E.ENAME AS EMP ,M.ENAME AS MGR
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.empno;
--151. Write a Query to display Ename, his hired date, his
--manager name and his manager hired date only if both
--were hired on the same date.
SELECT E.ENAME AS ENAME,E.HIREDATE AS EHIRE,M.ENAME AS MNAME,M.HIREDATE AS MHIRE
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE E.HIREDATE=M.HIREDATE;
--152. Write a Query to display the name of the employee
--along with the manager name and only if his manager
--was hired after him.
SELECT E.ENAME AS ENAME,E.HIREDATE AS EHIRE,M.ENAME AS MNAME,M.HIREDATE AS MHIRE
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE E.HIREDATE<M.HIREDATE;
--153. Write a Query to display Ename and his manager
--name only if both are working in the same location.
SELECT E.ENAME AS ENAME,M.ENAME AS MNAME
FROM (((SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO)INNER JOIN SCOTT.DEPT D
ON D.DEPTNO=E.DEPTNO)INNER JOIN SCOTT.DEPT D1
ON D1.DEPTNO=M.DEPTNO)
WHERE D.LOC=D1.LOC;
--154. Write a Query to display names of all the employees,
--salary should be same as scott salary.
SELECT E.ENAME 
FROM SCOTT.EMP E
WHERE SAL=(SELECT SAL 
           FROM SCOTT.EMP 
           WHERE ENAME='SCOTT' AND ENAME !=E.ENAME);
--155. Write a Query to display names of the employees who
--are working in the same department as ALLENS.

--156. Write a Query to display the name of an employee
--who was hired, where Ford was hired.
--157. Write a Query to display employees who don’t have a
--report manager.
SELECT ENAME
FROM SCOTT.EMP
WHERE MGR IS NULL;
--158. Write a Query to display an employee, who is not
--acting as a reporting manager.
SELECT ENAME 
FROM SCOTT.EMP 
WHERE EMPNO NOT IN(SELECT MGR FROM SCOTT.EMP)
--164. Employee who has at least 3 employees reporting to him
SELECT NAME
FROM(
SELECT DISTINCT M.ENAME AS NAME,COUNT(*) OVER(PARTITION BY M.ENAME ) AS "NO OF EMP"
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO)
WHERE "NO OF EMP">=3 ;

--165. Employee whose salary is equal to first max salary
SELECT ENAME,SAL
FROM (SELECT ENAME,SAL, DENSE_RANK() OVER(ORDER BY SAL DESC) R
      FROM SCOTT.EMP)
WHERE R=2;      
--166. Employee whose salary is either 4th or 7th maximum
SELECT ENAME, SAL
FROM (SELECT SAL , ENAME ,DENSE_RANK() OVER(ORDER BY SAL DESC) AS R
      FROM SCOTT.EMP)
WHERE R IN(4,7);      
--167. Employees whose salary comes in the top 4 maximum
SELECT ENAME, SAL
FROM (SELECT ENAME,SAL ,DENSE_RANK() OVER(ORDER BY SAL DESC) R
      FROM SCOTT.EMP)
WHERE R<=4;      
--168. Display bottom 10th maximum salary or least 10th max salary
--
--176. How many times salary should be repeated in a table
SELECT DISTINCT SAL,COUNT(SAL) OVER(PARTITION BY SAL) AS C
FROM SCOTT.EMP;
--177. Duplicate names in employee table
SELECT ENAME FROM(
SELECT DISTINCT ENAME,COUNT(ENAME) OVER(PARTITION BY ENAME) C
FROM SCOTT.EMP)
WHERE C>=2;
--180. Number of years of experience in the organization
--👉 Use MONTHS_BETWEEN(SYSDATE, HIREDATE) or DATEDIFF with window not required, but can also compute with LAG/LEAD if comparing tenure. (Mostly doable without window, but not wrong to use EXTRACT.)

--182. Employees hired on FRIDAY after March, before November any year
--👉 Core date function, not really window.
--
--183. Employees hired in alternative weeks starting Monday
--
--184. Total salary = (Monthly sal + COMM)
SELECT (SAL+NVL(COMM,0)) AS Total
FROM SCOTT.EMP;