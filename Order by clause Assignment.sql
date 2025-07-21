-- Q1
select sal
from scott.emp
order by sal asc;

-- Q2
select sal
from scott.emp
order by sal desc;

--Q3
select ename
from scott.emp
order by ename asc;

--Q4
select ename
from scott.emp
order by ename desc;

--Q5
select sal*12 as anual
from scott.emp
order by anual asc;

--Q6
select sal*12 as anual
from scott.emp
order by anual desc;

-- Q7
select sal*6 as anual
from scott.emp
order by anual asc;

--Q8
select sal*6 as anual
from scott.emp
order by anual desc;

--Q9
select ename as NAme
from scott.emp
where sal<1200
order by NAme asc;

--Q10
select DISTINCT Job
from scott.emp
order by job asc;

--Q11
-- diff output
select ename 
from scott.emp
where ename in('SALESMAN','PRECIDENT') and deptno in (20,30) and 
      HIREDATE >'31-DEC-1980' and 
      comm>300 and 
      ename like '__R%' 
order by ename desc;      

--Q12
select sal+sal*35/100 as "30% hike"
from scott.emp
order by "30% hike" asc;

--Q13
select sal-sal*14/100 as "d"
from scott.emp
order by "d" desc;


--Q14
select ename
from scott.EMP
order by sal desc;


--Q15
select (sal*6)+sal*6*32/100 as "half"
from scott.emp
order by "half" desc;