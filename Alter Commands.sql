-- create database School;
-- use School

-- create table TimeTable(
--  id int ,
--  Days varchar(40),
--  sub1 varchar(30),
--  sub2 varchar(40),
--  Break varchar(40),
--  sub3 varchar(40),
--  sub4 varchar(40),
--  sub5 varchar(40)
-- );


-- insert into TimeTable (id,Days,sub1,sub2,Break,sub3,sub4,sub5) 
-- Values (1,'MonDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'MonDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'TueDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'WedDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'ThrusDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'FriDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'SatDay','English','Maths','Break till 1:30','Marathi','Hindi','toc'),
-- (1,'SunDay','English','Maths','Break till 1:30','Marathi','Hindi','toc');


--  select * from TimeTable;


-- for add new volumn // add at last
-- Alter table TimeTable
-- ADD COLUMN Chutty varchar(40);

-- for add a column at first

-- Alter table TimeTable
-- add column This_id int primary Key auto_increment First;

-- for adding a column after a specific column 
-- ALTER TABLE TimeTable
-- add column LunchBreak date default '2003-07-01' after sub4;

-- for Rename a column 
-- Alter Table TimeTable
-- RENAME COLUMN Chutty TO leavs;
 

-- for changing the column data type 
-- ALTER TABLE TimeTable
-- MODIFY COLUMN leavs int;

-- for delete a column 

-- ALTER TABLE TimeTable
-- DROP COLUMN leavs;


-- truncate will delete all the data but not the schema 
-- deleteing the entire row we use truncate

-- for deleting the block data we replace that content with null or undefined

-- set SQL_SAFE_UPDATEs=0

-- update TimeTable
-- set sub1=null
-- where id=1 and Days='MonDay';

-- this is the delete query for deleting the row

-- delete from TimeTable
-- where Days='MonDay';

