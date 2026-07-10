---------------------------------------------------------------
-- Create Accounts Table
---------------------------------------------------------------

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    AccountType VARCHAR2(20),
    Balance NUMBER
);

---------------------------------------------------------------
-- Create Employees Table
---------------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    Department VARCHAR2(30),
    Salary NUMBER
);

---------------------------------------------------------------
-- Insert Sample Data
---------------------------------------------------------------

INSERT INTO Accounts VALUES (101, 'Alice', 'Savings', 10000);
INSERT INTO Accounts VALUES (102, 'Bob', 'Savings', 15000);
INSERT INTO Accounts VALUES (103, 'Charlie', 'Current', 20000);
INSERT INTO Accounts VALUES (104, 'David', 'Savings', 8000);

INSERT INTO Employees VALUES (1, 'John', 'IT', 50000);
INSERT INTO Employees VALUES (2, 'Emma', 'HR', 45000);
INSERT INTO Employees VALUES (3, 'Mike', 'IT', 60000);
INSERT INTO Employees VALUES (4, 'Sophia', 'Finance', 55000);

COMMIT;

---------------------------------------------------------------
-- Scenario 1
-- Process Monthly Interest
---------------------------------------------------------------

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

END;
/

---------------------------------------------------------------
-- Execute Procedure
---------------------------------------------------------------

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;

---------------------------------------------------------------
-- Scenario 2
-- Update Employee Bonus
---------------------------------------------------------------

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus IN NUMBER
)
AS
BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus / 100)
    WHERE Department = p_department;

    COMMIT;

END;
/

---------------------------------------------------------------
-- Execute Procedure
---------------------------------------------------------------

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

SELECT * FROM Employees;

---------------------------------------------------------------
-- Scenario 3
-- Transfer Funds
---------------------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_fromAccount IN NUMBER,
    p_toAccount IN NUMBER,
    p_amount IN NUMBER
)
AS

    v_balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_fromAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_fromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_toAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

---------------------------------------------------------------
-- Execute Procedure
---------------------------------------------------------------

SET SERVEROUTPUT ON;

BEGIN
    TransferFunds(101,102,2000);
END;
/

SELECT * FROM Accounts;

