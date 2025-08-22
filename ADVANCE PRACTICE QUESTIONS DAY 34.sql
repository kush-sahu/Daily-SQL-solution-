--1)List departments with more than one unique job role
SELECT DEPTNO
FROM SCOTT.EMP E1
WHERE JOB IN(SELECT JOB
             FROM SCOTT.EMP E2
             WHERE E1.DEPTNO=E2.deptno
             GROUP BY job
             HAVING COUNT(*)=1)
 GROUP BY DEPTNO
 HAVING COUNT(*)>2;            
--2)Find departments where all employees joined after 2020
select DEPTNO
from scott.emp
group by DEPTNO
having min(hiredate)>'31-DEC-2020';
--3)Find job roles which are common in more than 2 departments
select job
from scott.emp
group by job
having count(distinct deptno)>2;
--4)List departments where at least one employee is a 'Manager'
select deptno
from scott.emp
where job='MANAGER'
group by deptno;
--5)Find departments where all employees earn more than 30,000
select deptno
from scott.EMP
group by DEPTNO
having min(Sal)>30000;
--6)Which clause is mandatory when using GROUP BY with an aggregate function?
--A. ORDER BY
--B. HAVING
--C. WHERE
--D. None
--7)CAN I WRITE AGGREGATE FUNCTION IN GROUP BY CLAUSE ?
--8)FIND THE DUPLICATE RECORD FROM THE TABLE ?
--9)salary NUMBER(6,2)
--A.MAX VALUE
--B.MIN VALUE
--C.MIN +VE
--D.MIN -VE
--10)What is the primary rule of First Normal Form (1NF)?
--A. No multivalued attributes
--B. Only one primary key
--C. All columns must be numeric
--D. Table should have foreign key
--
--11)What condition is enforced by Second Normal Form (2NF)?
--A. Eliminate transitive dependency
--B. Ensure non-key attributes are fully functionally dependent on the primary key
--C. Ensure every table has a foreign key
--D. Remove all NULLs
--
--12) What is the purpose of normalization in databases?
--A. To improve UI design
--B. To eliminate redundancy and maintain data integrity
--C. To create indexes
--D. To format text
--
--13) Which normal form removes transitive dependency?
--A. 1NF
--B. 2NF
--C. 3NF
--D. BCNF
--
--14)What is transitive dependency?
--A. A dependency where a non-key attribute depends on another non-key attribute
--B. A dependency involving a key column
--C. A recursive dependency
--D. None of the above
--15)Which of the following is true about BCNF (Boyce-Codd Normal Form)?
--A. Every determinant must be a candidate key
--B. It allows partial dependency
--C. It is the same as 2NF
--D. It only applies to small tables
--16)Which of these violates 2NF?
--A. Table with composite primary key and partial dependency
--B. Table with only atomic columns
--C. Table with transitive dependency
--D. Table with redundant rows
--17) What happens if a database is not normalized?
--A. UI will not be responsive
--B. It may contain redundant and inconsistent data
--C. It performs faster
--D. Nothing happens
--18)Which of the following is an example of a transitive dependency?
--A. student_id → student_name, department_name AND department_name → HOD
-- B. emp_id → emp_name
-- C. subject_code → subject_name
-- D. id → address
--SUBSTR
--19)SELECT SUBSTR('ABCDEFG',1,4) "OUTPUT" FROM DUAL;
--20)SELECT SUBSTR('ABCDEFG',0,4) "OUTPUT" FROM DUAL;
--21)SELECT SUBSTR('ABCDEFG',3,4) "OUTPUT" FROM DUAL;
--22)SELECT SUBSTR('ABCDEFG',-4,3) "OUTPUT" FROM DUAL;
--23)SELECT SUBSTR('ABCDEFG',3) "OUTPUT" FROM DUAL;
--24)SELECT SUBSTR('ABCDEFG',-3) "OUTPUT" FROM DUAL;
--25)SELECT SUBSTR('ABCDEFG',8,4) "OUTPUT" FROM DUAL;
--26)SELECT SUBSTR('ABCDEFG',-8,4) "OUTPUT" FROM DUAL;
--27)SELECT SUBSTR('ABCDEFG',2,-1) "OUTPUT" FROM DUAL;
--28)SELECT SUBSTR('ABCDEFG',2,0) "OUTPUT" FROM DUAL;
--INSTR
--29)SELECT INSTR('CORPORATE FLOOR','OR') AS "INSTR OUTPUT" FROM DUAL;
--30)SELECT INSTR('CORPORATE FLOOR','OR',6) AS "INSTR OUTPUT" FROM DUAL
--31)SELECT INSTR('CORPORATE OR FLOOR','OR',3,2) AS "INSTR OUTPUT" FROM DUAL;
--32)Find departments with at least 3 different job roles