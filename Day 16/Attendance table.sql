create table attendance(
attensId int,
studId int,
attend_date date,
statuc varchar(60)
);



INSERT INTO attendance (attensId, studId, attend_date, statuc)
VALUES
  (201, 1, '2025-06-10', 'Present'),
  (202, 2, '2025-06-10', 'Absent'),
  (203, 3, '2025-06-10', 'Present'),
  (204, 4, '2025-06-10', 'Present'),
  (205, 5, '2025-06-10', 'Absent'),
  (206, 6, '2025-06-11', 'Present'),
  (207, 7, '2025-06-11', 'Present'),
  (208, 8, '2025-06-11', 'Present'),
  (209, 9, '2025-06-12', 'Absent'),
  (210, 10, '2025-06-12', 'Present'),
  (211, 1, '2025-06-13', 'Present'),
  (212, 2, '2025-06-13', 'Present'),
  (213, 3, '2025-06-13', 'Absent'),
  (214, 4, '2025-06-13', 'Present'),
  (215, 5, '2025-06-13', 'Present');
