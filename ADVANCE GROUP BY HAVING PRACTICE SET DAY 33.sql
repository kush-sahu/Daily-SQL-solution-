-- 1.WAQTD  JOB IN WHICH EVERY EMP HAVING DIFFERENT SALARY
select JOB
FROM SCOTT.EMP
GROUP BY JOB
HAVING COUNT(*)=COUNT(DISTINCT SAL);
-- 2.WAQTD HIREDATE  IN WHICH EVERY EMP  HAVE SAME SALARY
SELECT HIREDATE 
FROM SCOTT.EMP
GROUP BY HIREDATE
HAVING COUNT(DISTINCT SAL)=1;
-- 3.WAQTD HIREDATE IN WHICH EVERY EMP HAVE DIFFRENT SAL AND COMMISION
SELECT HIREDATE 
FROM SCOTT.EMP
GROUP BY HIREDATE
HAVING COUNT(DISTINCT SAL)=COUNT(*) AND COUNT(*)=COUNT(DISTINCT COMM);

--Find the JOBs where all employees have the same salary.
SELECT JOB
FROM SCOTT.EMP
GROUP BY JOB 
HAVING COUNT(*)=COUNT(DISTINCT SAL);
--Find the DEPTNOs where all employees have different JOBs.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING COUNT(*)=COUNT(DISTINCT JOB);
--Find the HIREDATEs where all employees have the same commission.
SELECT HIREDATE 
FROM SCOTT.EMP
GROUP BY HIREDATE
HAVING COUNT(DISTINCT COMM)=1;
--Find the MANAGERs who manage employees with all different salaries.

--Find the HIREDATEs where employees have the same JOB and same SAL.
SELECT HIREDATE
FROM SCOTT.EMP
GROUP BY HIREDATE
HAVING COUNT(DISTINCT SAL)=1 AND COUNT(DISTINCT JOB)=1;
--Find the DEPTNOs where every employee gets a commission (no NULL comm).
SELECT DEPTNO 
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING COUNT(*)=COUNT(COMM);
--Find the JOBs where maximum salary equals minimum salary.
SELECT JOB
FROM SCOTT.EMP
GROUP BY JOB
HAVING MIN(SAL)=MAX(sAL);
--Find the DEPTNOs where average salary is greater than 2000.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING AVG(SAL)>2000;
--Find the HIREDATEs where all employees earn more than 1500.
SELECT HIREDATE
FROM SCOTT.EMP
GROUP BY HIREDATE 
HAVING MIN(SAL)>1500;
--Find the MANAGERs who have at least 3 employees under them.

--Find the JOBs where every employee has a different commission.
SELECT JOB
FROM SCOTT.EMP
GROUP BY JOB
HAVING COUNT(DISTINCT COMM)==COUNT(*);
--Find the DEPTNOs where no two employees share the same salary.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO 
HAVING COUNT(DISTINCT SAL)=COUNT(SAL);
--Find the HIREDATEs where employees have at least 2 different JOBs.
SELECT HIREDATE
FROM SCOTT.EMP
GROUP BY HIREDATE 
HAVING COUNT(DISTINCT JOB)>=2;
--Find the JOBs where total salary is more than 5000.
SELECT JOB
FROM SCOTT.EMP
GROUP BY JOB
HAVING SUM(SAL)>5000;
--Find the DEPTNOs where maximum salary is greater than 3000 and minimum salary less than 1000.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING MAX(SAL)>3000 AND MIN(SAL)<1000;
--Find the HIREDATEs where number of employees is more than 2.
SELECT HIREDATE
FROM SCOTT.EMP
GROUP BY HIREDATE
HAVING COUNT(*)>2;
--Find the JOBs where all employees have NULL commission.
SELECT JOB
FROM SCOTT.EMP
GROUP BY JOB
HAVING COUNT(COMM)=0;
--Find the DEPTNOs where all employees are working under the same MANAGER.
SELECT DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING COUNT(DISTINCT MGR)=1;
--Find the HIREDATEs where the sum of salaries is greater than 4000.
select hiredate
from scott.emp
group by hiredate 
HAVING sum(sal)>4000;
--Find the JOBs where employees’ salaries are not unique (at least 2 employees with the same SAL).
select job 
from scott.emp
group by job
having count(sal)>count(distinct sal);
--Find the DEPTNOs where the difference between MAX(SAL) and MIN(SAL) is more than 2000.
select DEPTNO
FROM SCOTT.EMP
GROUP BY DEPTNO
HAVING MAX(SAL)-MIN(SAL)>2000;
--Find the JOBs where the highest salary is more than double the lowest salary.
SELECT JOB
FROM SCOTT.EMP
GROUP BY JOB
HAVING SMAX(SAL)>2*MIN(SAL);
--Find the HIREDATEs where the minimum salary is less than 1000.
select hiredate
from scott.emp
group by hiredate 
HAVING MIN(sal)<1000;
--Find the DEPTNOs where the maximum commission is greater than 500.
select DEPTNO
from scott.emp
group by DEPTNO 
HAVING MAX(COMM)>500;
--Find the JOBs where the average salary is equal to the minimum salary.
select JOB
from scott.emp
group by JOB
HAVING AVG(sal)=MIN(SAL);
--Find the MANAGERs where the maximum salary under them is above 3000.
select MGR
from scott.emp
group by MGR
HAVING MAX(sal)>3000;
--Find the DEPTNOs where all employees have salaries between 1000 and 3000.
select DEPTNO
from scott.emp
group by DEPTNO
HAVING MIN(SAL)>=1000 AND MAX(SAL)<=3000;
--Find the JOBs where maximum salary equals average salary.
select JOB
from scott.emp
group by JOB
HAVING MAX(SAL)=AVG(SAL);
--Find the HIREDATEs where total commission is 0.
select hiredate
from scott.emp
group by hiredate 
HAVING SUM(COMM)=0;
--Find the DEPTNOs where at least one employee has the maximum salary of the company.
select DEPTNO
from scott.emp
WHERE sal=(SELECT MAX(sAL) FROM SCOTT.EMP);