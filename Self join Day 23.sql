-- Q1 List the name of each employee along with the name of their manager.
SELECT E.ENAME AS EMP_NAME , M.ENAME AS MGR_NAME
FROM SCOTT.EMP E  JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO;


--Q2 Find all employees who earn more than their managers.
SELECT E.ENAME
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE E.SAL>M.SAL

-- Q3 Display all managers and how many employees report to them.
SELECT M.ENAME,COUNT(*)
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO 
GROUP BY M.ENAME;
-- Q4 List the employees who belong to a different department than their manager.
SELECT E.ENAME 
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO 
WHERE E.DEPTNO!=M.DEPTNO;

-- Q5 Show the names of employees who are also managing other employees.
SELECT M.ENAME
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO;

-- Q6 Find employees whose manager is Alice.
SELECT E.ENAME
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE M.ENAME='ALICE';
-- Q7 List all employees who don’t have a manager (i.e., top-level managers).
SELECT * FROM SCOTT.EMP;
-- Q8 Find employees who don’t manage anyone.
SELECT E.ENAME AS ENAME, M.ENAME AS MANAME
FROM SCOTT.EMP E RIGHT OUTER JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO
WHERE E.ENAME IS NULL;

SELECT * FROM SCOTT.EMP;
-- Q9 Display all employees along with their manager's salary.
SELECT E.ENAME,M.SAL
FROM SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO ;

-- Q10 List employees along with their managers, but only for employees working in the HR department.
SELECT E.ENAME
FROM (SCOTT.EMP E JOIN SCOTT.EMP M
ON E.MGR=M.EMPNO )INNER JOIN SCOTT.DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE D.DNAME="HR";

