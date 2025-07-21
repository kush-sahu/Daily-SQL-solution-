-- this is the third salary from the table 
-- select * from(
-- select dpt_name,salary , row_number() over(partition by dpt_name order by salary desc) as num
--  from(
-- select e.name,d.dpt_name,e.salary
-- from Employee e
-- left join department d
-- on e.dpt_id=d.dpt_id)t)t
-- where num=3
-- ;





-- this is the 3rd highest salary from the tanble

select dpt_name,salary ,num
from(
select dpt_name,salary,dense_rank() over(partition by dpt_name order by salary desc)as num
 from(
select e.name,d.dpt_name,e.salary
from Employee e
left join department d
on e.dpt_id=d.dpt_id)t)t
group by dpt_name,salary,num
having num=5
;