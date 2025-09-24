-- Find the 2nd highest salary in each department.
SELECT
    *
FROM
    (
        SELECT DISTINCT
            DEPTNO,
            SAL,
            DENSE_RANK()
            OVER(PARTITION BY DEPTNO
                 ORDER BY
                     SAL
            ) AS R
        FROM
            SCOTT.EMP
    )
WHERE
    R = 2;      
-- List employees who earn more than the average salary of their department.

SELECT
    ENAME,
    SAL
FROM
    SCOTT.EMP E
WHERE
    SAL > (
        SELECT
            AVG(SAL)
        FROM
            SCOTT.EMP
        WHERE
            DEPTNO = E.DEPTNO
    );
-- Display employees with their manager names, showing "NO MANAGER" if none.
SELECT
    E.ENAME                    AS EMPNAME,
    NVL(M.ENAME, 'NO MANAGER') AS MNAME
FROM
    SCOTT.EMP E
    LEFT JOIN SCOTT.EMP M ON E.MGR = M.EMPNO;
-- Find the top 3 highest paid employees per department.
SELECT
    DEPTNO,
    ENAME,
    SAL,
    R
FROM
    (
        SELECT
            ENAME,
            SAL,
            DEPTNO,
            ROW_NUMBER()
            OVER(PARTITION BY DEPTNO
                 ORDER BY
                     SAL
            ) AS R
        FROM
            SCOTT.EMP
    )
WHERE
    R <= 3;       
-- Show department with the highest average salary.
SELECT
    DEPTNO,
    AVG(SAL)
FROM
    SCOTT.EMP
GROUP BY
    DEPTNO
HAVING
    AVG(SAL) IN (
        SELECT
            MAX(AVG(SAL))
        FROM
            SCOTT.EMP
        GROUP BY
            DEPTNO
    );
-- List employees hired before their manager.
SELECT
    E.ENAME
FROM
         SCOTT.EMP E
    JOIN SCOTT.EMP M ON E.MGR = M.EMPNO
WHERE
    E.HIREDATE < M.HIREDATE;

-- Display employees who have the same job as someone in another department.

SELECT
    ENAME
FROM
    SCOTT.EMP E
WHERE
    JOB IN (
        SELECT
            JOB
        FROM
            SCOTT.EMP
        WHERE
            DEPTNO != E.DEPTNO
    )
UNION ALL
SELECT
    ENAME
FROM
    SCOTT.EMP E
WHERE
    JOB IN (
        SELECT
            JOB
        FROM
            SCOTT.EMP
        GROUP BY
            JOB
        HAVING
            COUNT(DISTINCT DEPTNO) > 1
    );

-- Show department(s) with the maximum number of employees.
SELECT
    *
FROM
    (
        SELECT
            DEPTNO,
            COUNT(*) AS NOOFEMP
        FROM
            SCOTT.EMP
        GROUP BY
            DEPTNO
        ORDER BY
            NOOFEMP DESC
    )
WHERE
    ROWNUM <= 1;
-- Find employees who earn more than all employees in department 30.
SELECT
    ENAME
FROM
    SCOTT.EMP
WHERE
    SAL = (
        SELECT
            MAX(SAL)
        FROM
            SCOTT.EMP
        WHERE
            DEPTNO = 30
    );
-- Show managers who manage more than 3 employees.
SELECT
    ENAME
FROM
    SCOTT.EMP
WHERE
    MGR IN (
        SELECT
            MGR
        FROM
            SCOTT.EMP
        GROUP BY
            MGR
        HAVING
            COUNT(ENAME) > 3
    );
-- List employees who joined in the same year as SCOTT.
SELECT
    ENAME,
    HIREDATE
FROM
    SCOTT.EMP
WHERE
    TO_CHAR(HIREDATE, 'YEAR') = (
        SELECT
            TO_CHAR(HIREDATE, 'YEAR')
        FROM
            SCOTT.EMP
        WHERE
            ENAME = 'SCOTT'
    );
-- Find departments where no employee earns commission.
SELECT
    DEPTNO
FROM
    SCOTT.EMP
GROUP BY
    DEPTNO
HAVING
    COUNT(COMM) = 0;

SELECT
    DEPTNO,
    COUNT(COMM)
FROM
    SCOTT.EMP
GROUP BY
    DEPTNO;
-- Display employees who earn more than their manager.

-- Show employees working in departments located in DALLAS.
SELECT
    ENAME,
    LOC
FROM
    SCOTT.EMP  E
    LEFT JOIN SCOTT.DEPT D ON E.DEPTNO = D.DEPTNO
WHERE
    LOC = 'DALLAS';
-- Display departments and total salary paid to employees (including departments with no employees).
SELECT
    DNAME,
    NVL(
        SUM(SAL),
        0
    )
FROM
    SCOTT.EMP  E
    RIGHT JOIN SCOTT.DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY
    DNAME;
-- Find employees who earn the minimum salary in their department.
SELECT
    ENAME
FROM
    SCOTT.EMP E
WHERE
    SAL = (
        SELECT
            MIN(SAL)
        FROM
            SCOTT.EMP E1
        WHERE
            E.DEPTNO = E1.DEPTNO
    );
-- Show employees with their job and department name using a FULL OUTER JOIN.
SELECT
    ENAME,
    JOB,
    DNAME
FROM
    SCOTT.EMP  E
    FULL OUTER JOIN SCOTT.DEPT D ON E.DEPTNO = D.DEPTNO;
-- List employees who are not managers but have salary higher than at least one manager.
SELECT
    ENAME
FROM
    SCOTT.EMP
WHERE
    EMPNO NOT IN (
        SELECT
            MGR
        FROM
            SCOTT.EMP
        WHERE
            MGR IS NOT NULL
    )
    AND SAL > ANY (
        SELECT
            M.SAL
        FROM
                 SCOTT.EMP E
            JOIN SCOTT.EMP M ON E.MGR = M.EMPNO
    );             
-- Find employees who joined on the same date as someone else in the company.
select ename
from scott.emp e1
where hiredate in(select HIREDATE
                 from scott.emp e2
                 where e1.empno!=e2.empno)
SELECT
    ENAME
FROM
    SCOTT.EMP
WHERE
    HIREDATE IN (
        SELECT
            HIREDATE
        FROM
            SCOTT.EMP
        GROUP BY
            HIREDATE
        HAVING
            COUNT(ENAME) > 1
    );                 
-- Display departments with at least one employee having salary above 3000.
SELECT
    DEPTNO
FROM
    SCOTT.EMP
GROUP BY
    DEPTNO
HAVING
    MAX(SAL) > 3000;
-- Show employee names with their department and location using INNER JOIN.
SELECT
    ENAME,
    DNAME,
    LOC
FROM
         SCOTT.EMP E
    INNER JOIN SCOTT.DEPT D ON E.DEPTNO = D.DEPTNO;
-- Find employees who earn more than the department average but less than the overall average.
SELECT
    ENAME
FROM
    SCOTT.EMP E1
WHERE
        SAL > (
            SELECT
                AVG(SAL)
            FROM
                SCOTT.EMP E2
            WHERE
                E1.DEPTNO = E2.DEPTNO
        )
    AND SAL < (
        SELECT
            AVG(SAL)
        FROM
            SCOTT.EMP
    );     
-- Show the difference between the highest and lowest salary per department.
SELECT
    DEPTNO,
    MAX(SAL) - MIN(SAL)
FROM
    SCOTT.EMP
GROUP BY
    DEPTNO;
-- Display department name, employee count, and average salary using LEFT JOIN.
SELECT
    DNAME,
    COUNT(*),
    AVG(SAL)
FROM
    SCOTT.DEPT D
    LEFT JOIN SCOTT.EMP  E ON D.DEPTNO = E.DEPTNO
GROUP BY
    DNAME;
-- Show employees who earn the Nth highest salary in the company (N = 5).
SELECT
    SAL
FROM
    (
        SELECT
            SAL,
            DENSE_RANK()
            OVER(
                ORDER BY
                    SAL DESC
            ) AS R
        FROM
            SCOTT.EMP
    )
WHERE
    R = 5;