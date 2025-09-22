use myemp;

select * from emp;
select * from payroll;
select * from PROJECT;
select * from DEPT;


-- QUESTIONS Inner Join → Employees with their department names

SELECT EMPNAME,DEPTNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTID=D.DEPTID;

-- → Show all employees and their payroll (if available)
SELECT EMPNAME,BASICSALARY,ALLOWANCES,DEDUCTIONS
FROM EMP E LEFT JOIN payroll P
ON E.EmpID=P.EMPID;

-- Show all departments with employees (even if no employee exists).
SELECT DEPTNAME, EMPNAME
FROM EMP E RIGHT JOIN DEPT d
ON E.DEPTID=D.DEPTID;

-- Display employee–manager hierarchy.
SELECT E.EMPNAME AS ENAME, M.EMPNAME AS MNAME
FROM EMP E JOIN EMP M
ON E.MANAGERID=M.EMPID;

-- Average salary per department
SELECT DEPTID, AVG(P.NETSALARY) AS AVGSAL
FROM EMP E LEFT JOIN PAYROLL P 
ON E.EMPID=P.EMPID
GROUP BY DEPTID;

-- Count of employees per project department
SELECT PROJECTNAME,COUNT(*) AS C
FROM EMP E RIGHT JOIN PROJECT P
ON E.DEPTID=P.DEPTID
GROUP BY PROJECTNAME;

-- Rank employees by salary
SELECT P.NETSALARY,dense_rank()  OVER(ORDER BY P.NETSALARY DESC) AS "RANK"
FROM EMP E LEFT JOIN PAYROLL P
ON E.EMPID=P.EMPID;

SELECT EMPNAME , P.NETSALARY
FROM EMP E INNER JOIN PAYROLL P
ON E.EMPID=P.EMPID
WHERE E.EMPID IN(SELECT EMPID
               FROM payroll 
               WHERE NETSALARY =(SELECT MAX(NETSALARY) FROM PAYROLL));
               
-- Find highest-paid employee per department
SELECT DEPTNAME,EMPNAME
FROM (SELECT EMPNAME, D.DEPTNAME,RANK() OVER(PARTITION BY E.DEPTID ORDER BY P.NETSALARY DESC) AS R
      FROM (EMP E LEFT JOIN PAYROLL P
      ON E.EMPID=P.EMPID)INNER JOIN DEPT D ON D.DEPTID=E.DEPTID)T
WHERE R=1;      


-- Running total of salaries
SELECT EMPNAME,SUM(NETSALARY) OVER(ORDER BY P.NETSALARY ASC) AS RUNNINGTOTAL
FROM EMP E JOIN PAYROLL P 
ON E.EMPID=P.EMPID;

-- Employees earning more than average salary
SELECT EMPNAME
FROM EMP E LEFT JOIN PAYROLL P
ON E.EMPID=P.EMPID
WHERE NETSALARY >(SELECT AVG(NETSALARY)
                  FROM EMP E LEFT JOIN PAYROLL P
                  ON E.EMPID=P.EMPID);
-- Employee with maximum salary
SELECT EMPNAME
FROM EMP E LEFT JOIN PAYROLL P
ON E.EMPID=P.EMPID   
WHERE NETSALARY=(SELECT MAX(NETSALARY)
                 FROM payroll) ;  
                 
-- Find employees who don’t have managers                 
SELECT EMPNAME
FROM EMP 
WHERE MANAGERID IS NULL;        

-- List departments that don’t have any employees         
SELECT DEPTNAME
FROM EMP E RIGHT JOIN DEPT D 
ON E.DEPTID=D.DEPTID
GROUP BY DEPTNAME
HAVING COUNT(E.EMPNAME)=0;

-- Find employees working in multiple projects (if a mapping table existed, extension question).
-- FIND NUMBER OF EMP WORKING IN EACH PROJEC
SELECT PROJECTNAME, COUNT(*) AS C
FROM ((PROJECT P LEFT JOIN DEPT D
ON P.DEPTID=D.DEPTID)LEFT JOIN EMP E
ON E.DEPTID=D.DEPTID)
GROUP BY  PROJECTNAME;

-- Find employees hired in 2021
SELECT EMPNAME, HIREDATE
FROM EMP
WHERE HIREDATE LIKE '2021%';

-- Find number of years each employee has worked
SELECT EMPNAME, YEAR(sysdate())-YEAR(HIREDATE) AS EXPERIANCE
FROM EMP;

-- Employees in IT or Finance departments (UNION)
SELECT EMPNAME
FROM EMP
WHERE deptid IN(SELECT deptid
               FROM DEPT
               WHERE DEPTNAME IN ('Finance'))
union 
SELECT EMPNAME
FROM EMP
WHERE deptid IN(SELECT deptid
               FROM DEPT
               WHERE DEPTNAME IN ('IT'));

-- Nth highest salary


select netsalary as sal
from(
select NetSalary , dense_rank() over(order by NetSalary  desc) as r
from emp e left join payroll p
on e.empid=p.empid)t
where r=3;

-- Employees earning more than their manager
select e.empname,m.empname
from (((emp e join emp m
on e.managerid=m.empid)
join payroll p
on p.empid=e.empid)join payroll p1
on p1.empid=m.empid)
where p.netSalary>p1.netsalary;

-- highest paid emp in each dept
select empname
from(
select e.empname, dense_rank() over(partition by deptid  order by p.netsalary desc) as r
from emp e left join payroll p
on e.empid=p.empid)t
where t.r=1;