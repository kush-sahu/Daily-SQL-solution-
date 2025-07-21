 -- WAQTD NAME OF EMPLOY WHO IS EARNING MAX SAL
 SELECT ENAME
 FROM SCOTT.EMP
 WHERE SAL IN(SELECT MAX(sAL)
              FROM SCOTT.EMP);

-- SAME FOR MIN SAL
SELECT ENAME
 FROM SCOTT.EMP
 WHERE SAL IN(SELECT MIN(sAL)
              FROM SCOTT.EMP);
-- FOR SECOND MAX SAL
SELECT MAX(sAL)
FROM SCOTT.EMP
WHERE SAL<(SELECT MAX(SAL)
           FROM SCOTT.EMP);



-- FOR NAME OF THE EMP WHO IS EARNING SECOND MAX SAL
 SELECT ENAME
 FROM SCOTT.EMP
 WHERE SAL IN(SELECT MAX(sAL)
              FROM SCOTT.EMP
              WHERE SAL<(SELECT MAX(SAL)
                         FROM SCOTT.EMP));              

-- FOR SECOND MIN SAL
SELECT MIN(sAL)
FROM SCOTT.EMP
WHERE SAL>(SELECT MIN(SAL)
            FROM SCOTT.EMP);                        

--   
 SELECT ENAME
 FROM SCOTT.EMP
 WHERE SAL IN(SELECT MIN(sAL)
              FROM SCOTT.EMP
              WHERE SAL>(SELECT MIN(SAL)
                         FROM SCOTT.EMP));           

--Q1 WAQTD NAME OF AN EMP EARNING 2ND MAX SAL. 
SELECT ENAME
FROM SCOTT.EMP
WHERE SAL IN(SELECT MAX(SAL)
             FROM SCOTT.EMP
             WHERE SAL<(SELECT MAX(SAL)
                        FROM SCOTT.EMP));
 -- Q2 WAQTD  NAME OF EMP WHO ARE EARNING MORE THAN WARD & WORKING IN SAME DEPTNO AS THAT OF BLAKE & HIRED BEFORE TURNER                        
 SELECT ENAME
 FROM SCOTT.EMP
 WHERE SAL >(SELECT SAL 
             FROM SCOTT.EMP
             WHERE ENAME='WARD')
       AND DEPTNO IN(SELECT DEPTNO
                     FROM SCOTT.EMP
                     WHERE ENAME='BLAKE')   
       AND HIREDATE <(SELECT HIREDATE 
                      FROM SCOTT.EMP
                      WHERE ENAME='TURNER');                 
  -- Q3  WAQTD NAMES OF AN EMP HIRED AFTER SMITH, BEFORE MILLER & WORKING IN SAME DESIGNATION AS THAT OF JONES IN SALES DEPTARTMENT                   
  SELECT ENAME
  FROM SCOTT.EMP
  WHERE HIREDATE >(sELECT HIREDATE 
                   FROM SCOTT.EMP
                   WHERE ENAME='SMITH')
        AND  HIREDATE <(sELECT HIREDATE 
                   FROM SCOTT.EMP
                   WHERE ENAME='MILLER')          
        AND JOB IN(SELECT JOB 
                   FROM SCOTT.EMP
                   WHERE ENAME='JONES')
        AND DEPTNO IN(SELECT DEPTNO
                      FROM SCOTT.DEPT
                      WHERE DNAME='SALES');                        


    --  Q4  WAQTD NAMES OF AN EMP EARNING LESS THAN KING & HIRED BEFORE MILLER IN NEW YORK                
    SELECT ENAME
    FROM SCOTT.EMP
    WHERE SAL<(SELECT SAL
               FROM SCOTT.EMP
               WHERE ENAME='KING')
          AND HIREDATE<(SELECT HIREDATE
                          FROM SCOTT.EMP
                          WHERE ENAME='MILLER')   
          AND DEPTNO IN(SELECT DEPTNO 
                        FROM SCOTT.DEPT
                        WHERE LOC='NEW YORK');                
-- Q5 WAQTD NAME OF EMP EARNING 3RD MIN SAL. 
SELECT ENAME
FROM SCOTT.EMP
WHERE SAL IN(SELECT MIN(SAL)
             FROM SCOTT.EMP
             WHERE sal>(select min(sal)
                        from scott.emp
                        where sal>(select min(sal)
                                   from scott.emp)) ); 

--Q6 WAQTD LOC OF AN EMP EARNING 3RD MAX SAL
SELECT LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN(
SELECT DEPTNO
FROM SCOTT.EMP
WHERE SAL IN(SELECT MIN(SAL)
             FROM SCOTT.EMP
             WHERE sal>(select min(sal)
                        from scott.emp
                        where sal>(select min(sal)
                                   from scott.emp))) ); 
-- Q7 WAQTD NAMES OF EMP HIRED LAST
SELECT ENAME 
FROM SCOTT.EMP
WHERE HIREDATE IN(SELECT MAX(HIREDATE)
                  FROM SCOTT.EMP);
-- Q8 WAQTD NAME OF THE AN EMP HIRED 2ND              
SELECT ENAME
FROM SCOTT.EMP
WHERE HIREDATE IN(SELECT MIN(HIREDATE)
                  FROM SCOTT.EMP
                  WHERE HIREDATE >(SELECT MIN(HIREDATE )
                                   FROM SCOTT.EMP));

-- Q9  WAQTD LOC OF EMP HIRED 2ND LAST. 
SELECT LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN(SELECT DEPTNO
                FROM SCOTT.EMP
                WHERE HIREDATE IN(sELECT MAX(HIREDATE)
                                  FROM SCOTT.EMP
                                  WHERE HIREDATE<(sELECT MAX(HIREDATE)
                                  FROM SCOTT.EMP)));
-- Q10 WAQTD NAME OF THE EMP EARNING 5TH MIN SAL. ENAME
SELECT ENAME
FROM SCOTT.EMP
WHERE SAL IN(SELECT MIN(SAL)
             FROM SCOTT.EMP
             WHERE SAL>(SELECT MIN(SAL)
                        FROM SCOTT.EMP
                        WHERE SAL>(SELECT MIN(SAL)
                                   FROM SCOTT.EMP
                                   WHERE SAL>(SELECT MIN(SAL)
                                              FROM SCOTT.EMP
                                              WHERE SAL>(SELECT MIN(SAL)
                                                         FROM SCOTT.EMP)))));
 --Q11 WAQTD LOCATION OF AN EMP EARNING 2ND MIN SAL. 

SELECT LOC
FROM SCOTT.DEPT
WHERE DEPTNO IN(SELECT DEPTNO
                FROM SCOTT.EMP
                WHERE SAL IN(SELECT MIN(SAL)
                            FROM SCOTT.EMP
                             WHERE SAL>(SELECT MIN(SAL)
             FROM SCOTT.EMP)));
 --Q12  WAQTD NAME OF AN EMP EARNING 4TH MIN SAL.
 -- DIFF ANSWER            
 SELECT ENAME
FROM SCOTT.EMP
WHERE SAL IN(SELECT MIN(SAL)
             FROM SCOTT.EMP
             WHERE SAL>(SELECT MIN(SAL)
                        FROM SCOTT.EMP
                        WHERE SAL>(SELECT MIN(SAL)
                                   FROM SCOTT.EMP
                                   WHERE SAL>(SELECT MIN(SAL)
                                              FROM SCOTT.EMP))));
 
 -- Q13 WAQTD DNAME OF EMP WHOSE NAME IS SMITH. 
SELECT DNAME
FROM SCOTT.DEPT
WHERE DEPTNO IN(SELECT DEPTNO 
                FROM SCOTT.EMP
                WHERE ENAME='SMITH');

  --Q14 WAQTD DNAME, LOC OF THE EMP'S WHOSE NAME IS KING. 
SELECT DNAME,LOC
FROM SCOTT.DEPT
WHERE  DEPTNO IN(SELECT DEPTNO 
                FROM SCOTT.EMP
                WHERE ENAME='KING');             
 --- Q15 WAQTD LOC OF EMP WHOSE EMPNO IS 7902. 
SELECT LOC
FROM SCOTT.DEPT
WHERE  DEPTNO IN(SELECT DEPTNO 
                FROM SCOTT.EMP
                WHERE EMPNO=7902);                


-- Q16   WAQTD DETAILS OF AN EMP WORKING AS PRESIDENT AND EARNING MORE THAN SCOTT AND HIRED AFTER SMITH.              
SELECT *
FROM SCOTT.EMP
WHERE JOB ='PRESIDENT' AND
      SAL>(SELECT SAL
      FROM SCOTT.EMP
      WHERE ENAME='SCOTT')
      aND HIREDATE>(SELECT HIREDATE
                    FROM SCOTT.EMP
                    WHERE ENAME='SMITH');







