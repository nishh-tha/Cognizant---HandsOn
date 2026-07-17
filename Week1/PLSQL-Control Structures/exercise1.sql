---------------------------------------------------------------
-- Create Customers Table
---------------------------------------------------------------

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);

---------------------------------------------------------------
-- Create Loans Table
---------------------------------------------------------------

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER,
    DueDate DATE,
    CONSTRAINT FK_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

---------------------------------------------------------------
-- Insert Sample Data
---------------------------------------------------------------

INSERT INTO Customers VALUES (1, 'Alice', 65, 12000, 'FALSE');
INSERT INTO Customers VALUES (2, 'Bob', 45, 8000, 'FALSE');
INSERT INTO Customers VALUES (3, 'Charlie', 70, 20000, 'FALSE');
INSERT INTO Customers VALUES (4, 'David', 35, 5000, 'FALSE');

INSERT INTO Loans VALUES (101, 1, 8.5, SYSDATE + 20);
INSERT INTO Loans VALUES (102, 2, 9.0, SYSDATE + 45);
INSERT INTO Loans VALUES (103, 3, 7.5, SYSDATE + 10);
INSERT INTO Loans VALUES (104, 4, 8.0, SYSDATE + 60);

COMMIT;

---------------------------------------------------------------
-- Scenario 1
-- Apply a 1% discount to loan interest rates
-- for customers above 60 years old.
---------------------------------------------------------------

BEGIN

    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Age > 60
    )
    LOOP

        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = cust.CustomerID;

    END LOOP;

    COMMIT;

END;
/

---------------------------------------------------------------
-- Verify Scenario 1
---------------------------------------------------------------

SELECT * FROM Loans;

---------------------------------------------------------------
-- Scenario 2
-- Promote customers with balance above $10,000
-- to VIP status.
---------------------------------------------------------------

BEGIN

    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP

        UPDATE Customers
        SET IsVIP = 'TRUE'
        WHERE CustomerID = cust.CustomerID;

    END LOOP;

    COMMIT;

END;
/

---------------------------------------------------------------
-- Verify Scenario 2
---------------------------------------------------------------

SELECT * FROM Customers;

---------------------------------------------------------------
-- Scenario 3
-- Print reminder messages for loans due
-- within the next 30 days.
---------------------------------------------------------------

SET SERVEROUTPUT ON;

BEGIN

    FOR loan_rec IN (
        SELECT c.Name,
               l.DueDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan due for '
            || loan_rec.Name
            || ' on '
            || TO_CHAR(loan_rec.DueDate, 'DD-MON-YYYY')
        );

    END LOOP;

END;
/

