CREATE TABLE PLACEMENT(
placId BIGINT,
studId int,
company varchar(100),
designation varchar(100),
salary int,
hiredate date
);


INSERT INTO placement (placId, studId, company, designation, salary, hiredate)
VALUES
  (101, 1, 'Infosys', 'Java Developer', 500000.00, '2024-02-10'),
  (102, 2, 'TCS', 'Data Analyst', 600000.00, '2024-03-05'),
  (103, 5, 'Wipro', 'Backend Developer', 550000.00, '2024-04-12'),
  (104, 2, 'Deloitte', 'ML Engineer', 650000.00, '2024-05-01'),
  (105, 8, 'Capgemini', 'Java Developer', 520000.00, '2024-04-20');
