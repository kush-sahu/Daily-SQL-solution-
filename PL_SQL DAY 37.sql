-- select * 
-- from PROJECTS.PROJECT_MILESTONES;

/* Common table expression 
*/
with sal1 as(
    select max(sal) as Msal
    from scott.emp
)
select max(sal)
from scott.emp e ,sal1 s
where e.sal<s.Msal;


-- for updation trigger in emp table
-- before trigger
create table emp(
    ename varchar(30),
    job varchar(40),
    deptno number
);
insert into emp(ename,job,deptno)
values ('kush sahu','manager',34),('love sahu','hr',20),('ankita raja','CEo',20);

alter table emp
add sal number default 3000;

select * from emp;


create or replace trigger fire
before update or insert on emp
for each row 
begin
    if :new.sal<0
       then :new.sal:=0;
    end if;
end ;
/    

update emp
set sal=-40
where deptno=34;

-- dummy table for operation
create table dummy (
    tname varchar(40),
    sign varchar(30),
    Modified_date date
);
drop table dummy;
select * from dummy;
-- after trigger
create or replace trigger fire1 
after update or delete or insert on emp
begin 
   insert into dummy(tname, sign, Modified_date)
   values ('emp','Modification',systimestamp);
end;
   
