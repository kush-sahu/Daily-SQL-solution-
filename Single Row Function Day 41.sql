-- 🔹 Character/String Functions (SRF)
-- Display all employee names in uppercase.
SELECT UPPER(ENAME) AS UPPER_CASE
FROM SCOTT.EMP;
-- Display employee names in lowercase whose job is ‘CLERK’.
SELECT LOWER(ENAME) 
FROM SCOTT.EMP
WHERE JOB='CLERK'; 
-- Display employee names with only the first letter capitalized.
SELECT INITCAP(ENAME)
FROM SCOTT.EMP;
-- Display the length of each employee’s name.
SELECT ENAME,LENGTH(ENAME)AS length_OF_ENAME
FROM SCOTT.EMP;

-- Display employee names reversed.
SELECT ENAME,REVERSE(ENAME)AS reversed
FROM SCOTT.EMP;
-- Display employee names along with their first 3 characters.
SELECT ENAME, substr(ename,1,3)as First_3
FROM SCOTT.EMP;

-- Display employee names, but remove leading and trailing spaces.
select trim('this is the name ') as tname from dual;
-- Display employee names where the 5th character is ‘A’.
select ename
from scott.EMP
where substr(ename,5,1)='A';
-- Display employee names concatenated with their job using ||.
select ename||' '||job
from scott.emp;
-- Display employee names after replacing all ‘A’ with ‘@’.
select replace(ename,'A','@')
from scott.emp;
-- 🔹 Number Functions (SRF)
-- Display employee names with their salary rounded to the nearest 1000.
select ename,round(sal,-3) from scott.emp;
-- Display employee names with their salary truncated to the nearest 1000.

-- Display employee names with their commission – if null, show 0 using NVL().
select ename, nvl(comm,0)as commi
from scott.emp;
-- Display employee names with the modulus of salary divided by 2.
select ename,mod(sal,2)
from scott.emp;
-- Display the absolute value of SAL - 2000 for each employee.
select abs(sal-2000)
from scott.emp;
-- Display employee names with salary raised to power 2.
select ename,power(sal,2),sal
from scott.emp;
-- Display the square root of salaries greater than 5000.
select sqrt(sal)
from scott.emp
where sal>5000;

SELECT INSTR('ORACLE SQL', 'L', -1, 2) AS result
FROM dual;

-- 🔹 Special Functions (SRF)
-- 
-- Display employee names with commission. If commission is null, display ‘NO COMM’ using NVL2.
select ename,nvl2(comm,to_char(comm),'no comm') from scott.emp;
-- Display employee name and a message: ‘HIGH SALARY’ if salary > 3000, else ‘LOW SALARY’ using CASE.
select ename, case when sal>3000 then 'HIGH SALARY' else 'LOW SALARY' end as sign
from scott.emp;
-- Display employee name and job, but use DECODE to rename jobs:
-- MANAGER → ‘BOSS’
-- CLERK → ‘WORKER’
-- Others → ‘STAFF’
select decode(job , 'MANAGER','BOSS','CLERK','WORKER','STAFF') from scott.emp;
-- Display employee names and their length bucket using CASE:

-- <5 → ‘SHORT NAME’
-- 
-- 5–8 → ‘MEDIUM NAME’
-- 
-- 8 → ‘LONG NAME’
-- 
-- Display employee names and salary, show ‘ODD’ or ‘EVEN’ depending on salary using MOD.
select ename,sal,case when mod(sal,2)=0 then 'EVEN' else 'ODD' end as sign from scott.emp;
-- 🔹 Date Functions (SRF)
-- 
-- Display the current system date.
select sysdate as dates
from dual;
-- Display the employee name, hire date, and day of the week they were hired.
select ename,hiredate,to_char(hiredate,'DAY') AS days
from scott.emp;
-- Display the employee name and number of months they have worked till today.
select ename, months_between(sysdate,hiredate) 
from scott.emp
-- Display employee name and next Friday after their hire date.
-- 
-- Display employee name and hire date in the format ‘DD-MON-YYYY’.
-- 
-- Display employee name and hire date in the format ‘Month DD, YYYY’.
-- 
-- Display employee name and the last day of the month they were hired.
-- 
-- Display employee name and the difference in days between today and hire date.
-- 
-- Display employee name and hire date after adding 6 months.
-- 
-- Display employee name and hire date in ‘DD/MM/YYYY HH:MI:SS AM’ format.



--Show employee names padded to 15 characters with * on the left.
select lpad(ename,15,'*')
from scott.emp;

--Show employee names padded to 15 characters with - on the right.
select ename,rpad(ename,15,'-')
from scott.emp;

-- Display employee names and create a masking effect (show only first 2 characters, replace rest with X).
select ename,rpad(substr(ename,1,2),length(ename),'X')
from scott.emp;

--Show employee names aligned in a 10-character column (right aligned with spaces).
select rpad(ename,10,' ')
from scott.emp;

-- Display employee names in reverse order and padded to 12 characters with #.
select rpad(reverse(ename),12,'#')
from scott.emp;

-- Concatenate employee name and job, ensuring job is always 10 characters wide (padded with . on right).
select ename|| '-' ||rpad(job,10,'.')
from scott.emp;

-- Display the first occurrence position of ‘A’ in employee names, and if not found, return 'Not Present'.
select ename,
       case when to_char(instr(ename,'A'))!='0' 
       then to_char(instr(ename,'A'))  
       else 'Not Present' end as firstoccurance
from scott.emp;

-- Display employee names with only vowels removed.
select ename,replace(replace(replace(replace(replace(ename,'A',''),'E',''),'I',''),'O',''),'U','') as removed
from scott.emp;

-- Show employee names and their initials (first letter of ename + first letter of job).
-- select ename,substr(ename,1,1)||substr(job,1,1) as ename2
-- from scott.emp;

-- Format employee names into a fixed 20-character display with both sides padded (simulate centering).
select 
case when mod(length(ename),2)=0 
     then lpad(substr(ename,1,length(ename)/2),10,'*')||rpad(substr(ename,length(ename)/2+1),10,'*')
     else  lpad(substr(ename,1,length(ename)/2),10,'*')||rpad(substr(ename,length(ename)/2+1),11,'*')
     end  as pad
from scott.emp;

-- or

select rpad(lpad(ename,length(ename)+((20-length(ename))/2),'*'),20,'*') 
from scott.emp;

-- Masking Sensitive Data (like employee names → only last 2 chars visible)
select lpad(substr(ename,-2),length(ename),'*')
from scott.emp;

-- Extract Domain from Email-like String
select substr('kushsahu@yahoo.com',instr('kushsahu@yahoo.com','@')+1)as Domain
from dual;

-- Find Nth Word from a String
select substr('this is the word that i am searching',instr('this is the word that i am searching',' ',1,4)+1,(instr('this is the word that i am searching',' ',1,5)-instr('this is the word that i am searching',' ',1,4)-1)) 
from dual;

-- Generate Fixed Width Report Line
SELECT RPAD(ename, 10, ' ') || RPAD(job, 12, ' ') || LPAD(sal, 8, ' ') AS report_line
FROM scott.emp;

-- Repeat a Character N Times
select lpad('*',10,'*') from dual;

-- Find How Many Times 'A' Letter Appears
select length(ename)-length(replace(ename,'A','')) as A_appeared
from scott.emp;

-- Create a Progress-Bar Style Output
SELECT ename,
       RPAD('=', ROUND(sal/1000), '=') AS progress_bar
FROM emp;
