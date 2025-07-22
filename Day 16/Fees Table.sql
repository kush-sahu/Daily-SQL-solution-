create table fees(
feeId int,
studId int,
amount bigint,
pay_date date,
modeofpayment varchar(300)
);



INSERT INTO fees (feeId, studId, amount, pay_date, modeofpayment)
VALUES
  (301, 1, 15000.00, '2023-06-11', 'UPI'),
  (302, 2, 20000.00, '2023-07-16', 'Cash'),
  (303, 3, 15000.00, '2023-06-21', 'Card'),
  (304, 4, 18000.00, '2023-08-06', 'UPI'),
  (305, 5, 15000.00, '2023-06-26', 'Card'),
  (306, 6, 22000.00, '2023-07-02', 'UPI'),
  (307, 7, 17000.00, '2023-08-11', 'Cash'),
  (308, 8, 16000.00, '2023-07-01', 'UPI'),
  (309, 9, 20000.00, '2023-07-21', 'UPI'),
  (310, 10, 19000.00, '2023-08-16', 'Card');
