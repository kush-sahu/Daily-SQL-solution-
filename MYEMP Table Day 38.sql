create database MYEMP;
use MYEMP;
CREATE TABLE DEPT (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

CREATE TABLE EMP (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(100),
    HireDate DATE,
    DeptID INT,
    ManagerID INT,
    FOREIGN KEY (DeptID) REFERENCES DEPT(DeptID),
    FOREIGN KEY (ManagerID) REFERENCES EMP(EmpID) -- self-referencing for hierarchy
);


CREATE TABLE PAYROLL (
    PayrollID INT PRIMARY KEY,
    EmpID INT UNIQUE,
    BasicSalary bigint NOT NULL,
    Allowances bigint DEFAULT 0,
    Deductions bigint DEFAULT 0,
    NetSalary  bigint generated always as(BasicSalary + Allowances - Deductions),
    FOREIGN KEY (EmpID) REFERENCES EMP(EmpID)
);


CREATE TABLE PROJECT (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(150) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES DEPT(DeptID)
);


