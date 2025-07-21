-- Q1
select min(sal),DEPTNO
from scott.emp
group by deptno;

-- Q2
SELECT avg(sal),job
from scott.emp
group by job

-- Q3
select count(*),deptno
from scott.emp
where sal>2000
group  by deptno;

-- Q4
-- diff output
select count(*) ,DEPTNO
from scott.emp
where job !='PRECIDENT'
group by deptno;

-- Q5
select count(*),DEPTNO
from scott.emp
where job='MANAGER'
group by DEPTNO


-- Q6
select avg(sal),job
from scott.emp
where deptno not in(20)
group by job;

-- Q7
select count(*),job
from scott.emp
where ename like '%A%'
group by job;


-- Q8
select count(*),deptno
from scott.emp
where job='CLERK'
group by deptno;

--Q9
select count(*),deptno
from scott.emp
where hiredate like '%81%'
group by deptno;

-- Q10
select count(*),deptno
from scott.emp
where sal<1000
group by deptno;

-- Q11
select count(*),deptno
from scott.emp
where sal=3000
group by deptno;

-- Q12
select max(sal),DEPTNO
from scott.emp
where job='CLERK'
group by deptno;


--Q13
select count(*),job
from scott.emp
where hiredate like '%FEB%'
group by job;

-- Q14
select count(*),deptno
from scott.emp
where job in('ANALYST','PRESIDENT') and sal>2000
group by DEPTNO

-- Q15
select count(*),deptno
from scott.emp
where job!='PRECIDENT'
group by deptno;

--Q16
select sum(sal),job
from scott.emp
group by job;

--Q17
select avg(sal),deptno
from scott.emp
where deptno!=20
group by deptno


-- Q18
select count(*),job
from scott.emp
where ename like '%A%'
group by job;

--Q19
select count(*),avg(sal),deptno
from scott.emp
where sal>2000
group by deptno;

--Q20
   select count(*),sum(sal),deptno
   from scott.emp
   where job='SALESMAN'
   group by DEPTNO;      

   --Q21
   select count(*), max(sal),job
   from scott.emp
   group by job;       

   -- Q22
   select count(*),sal 
   from scott.emp
   group by sal;                                                                                                                                                                                                                                                                      

   -- Q23
   select count(*),deptno
   from scott.emp
   group by deptno
   having count(*)>=2;

   -- Q24
   select avg(sal),max(sal),min(sal),job
   from scott.emp
   where Extract (year from hiredate)>1980
   group by job;

   -- Q25
   select count(*),deptno
   from scott.emp 
   where sal>2000 and hiredate like '%87%'
   group by deptno;