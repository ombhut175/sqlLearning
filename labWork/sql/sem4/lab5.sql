-- Creating PersonInfo Table
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);
-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY(1,1),
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL,
);


-- From the above given tables perform the following queries:
-- Part – A
-- 1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display
-- a message “Record is Affected.”
CREATE OR ALTER TRIGGER TR_PERSONINFO_CHANGE_RECORD
ON PersonInfo
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
    PRINT 'RECORD IS AFFECTED'
END

SELECT * FROM PersonInfo

TRUNCATE TABLE PersonLog;
TRUNCATE TABLE PersonInfo;

DROP TABLE PersonLog


INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
VALUES 
(2, 'Jane Smith', 60000.00, '2021-07-22 10:30:00', 'Los Angeles', 28, '1996-08-25 00:00:00'),
(3, 'Michael Brown', 45000.00, '2019-03-14 11:00:00', 'Chicago', 35, '1989-11-10 00:00:00'),
(4, 'Emily White', 55000.00, '2022-01-18 14:00:00', 'Houston', 26, '1997-05-05 00:00:00'),
(5, 'Daniel Green', 47000.00, '2020-09-25 08:45:00', 'Miami', 32, '1992-12-12 00:00:00'),
(6, 'Samantha Adams', 58000.00, '2023-05-15 10:00:00', 'Seattle', 27, '1997-06-30 00:00:00');

INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
VALUES (7, 'Samantha Adams', 58000.00, '2023-05-15 10:00:00', 'Seattle', 27, '1997-06-30 00:00:00')
SELECT * FROM PERSONLOG

-- 2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that,
-- log all operations performed on the person table into PersonLog.
CREATE TRIGGER TR_PERSONINFO_INSERT_RECORD
ON PersonInfo
AFTER INSERT
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250) ,@Operation VARCHAR(50),@UpdateDate DATETIME
    
    SET @UpdateDate = GETDATE()
    SET @Operation = 'INSERTED'

    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM inserted
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID,@PERSONNAME,@Operation,@UpdateDate)

END


INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
VALUES (6, 'Samantha Adams', 58000.00, '2023-05-15 10:00:00', 'Seattle', 27, '1997-06-30 00:00:00');



CREATE TRIGGER TR_PERSONINFO_UPDATE_RECORD
ON PersonInfo
AFTER UPDATE
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250) ,@Operation VARCHAR(50),@UpdateDate DATETIME
    
    SET @UpdateDate = GETDATE()
    SET @Operation = 'UPDATED'

    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM deleted
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID,@PERSONNAME,@Operation,@UpdateDate)
END

-- Update salary and city of an existing person in PersonInfo
UPDATE PersonInfo
SET Salary = 62000.00, City = 'San Francisco'
WHERE PersonID = 4;


CREATE TRIGGER TR_PERSONINFO_DELETE_RECORD
ON PersonInfo
AFTER DELETE
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250) ,@Operation VARCHAR(50),@UpdateDate DATETIME
    
    SET @UpdateDate = GETDATE()
    SET @Operation = 'DELETED'

    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM deleted
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID,@PERSONNAME,@Operation,@UpdateDate)
END

-- Delete a person from PersonInfo
DELETE FROM PersonInfo
WHERE PersonID = 4;

SELECT * FROM PersonLog;


DROP TRIGGER TR_PERSONINFO_DELETE_RECORD
-- 3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo
-- table. For that, log all operations performed on the person table into PersonLog.

CREATE TRIGGER TR_PERSONINFO_INSERT_INSTEADOF
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250) ,@Operation VARCHAR(50),@UpdateDate DATETIME
    
    SET @UpdateDate = GETDATE()
    SET @Operation = 'INSERTED'

    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM inserted
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID,@PERSONNAME,@Operation,@UpdateDate)
END

TRUNCATE TABLE PERSONINFO

INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
VALUES (1, 'Samantha Adams', 58000.00, '2023-05-15 10:00:00', 'Seattle', 27, '1997-06-30 00:00:00')

SELECT * FROM PERSONLOG

CREATE TRIGGER TR_PERSONINFO_UPDATE_INSTEADOF
ON PersonInfo
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250)
    DECLARE @ID2 INT,@PERSONNAME2 VARCHAR(250)


    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM inserted
    SELECT @ID2=PersonID,@PERSONNAME2=PersonName FROM deleted

    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID,@PERSONNAME,'INSERTED',GETDATE())
    
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID2,@PERSONNAME2,'DELETED',GETDATE())
END


CREATE TRIGGER TR_PERSONINFO_DELETE_INSTEADOF
ON PersonInfo
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250)

    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM deleted
    INSERT INTO PersonLog (PersonID, PersonName, Operation, UpdateDate) VALUES 
    (@ID,@PERSONNAME,'DELETED',GETDATE())
END

DROP TRIGGER TR_PERSONINFO_INSERT_INSTEADOF;
DROP TRIGGER TR_PERSONINFO_UPDATE_INSTEADOF;
DROP TRIGGER TR_PERSONINFO_DELETE_INSTEADOF;


SELECT * FROM PersonInfo;
-- 4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into
-- uppercase whenever the record is inserted.
CREATE TRIGGER TR_PERSONINFO_CAPITALNAME_RECORD
ON PERSONINFO
AFTER INSERT
AS
BEGIN
    DECLARE @ID INT,@PERSONNAME VARCHAR(250)

    SELECT @ID=PersonID,@PERSONNAME=PersonName FROM inserted

    UPDATE PersonInfo
    SET PersonName = UPPER(@PERSONNAME)
    WHERE PersonID = @ID
END
-- 5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
CREATE TRIGGER TR_PERSONINFO_PREVENT_DUPLICATE_ENTRIES
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
    
    INSERT INTO PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate) 
    SELECT PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate FROM inserted
    WHERE PERSONNAME NOT IN (SELECT PersonNAME FROM PersonInfo)
    
END

DROP TRIGGER TR_PERSONINFO_PREVENT_DUPLICATE_ENTRIES;

-- 6. Create trigger that prevent Age below 18 years.

CREATE TRIGGER TR_PERSONINFO_PREVENT_AGE_BELOW_18_ENTRIES
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate) 
    SELECT PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate FROM inserted
    WHERE Age > 18
END

DROP TRIGGER TR_PERSONINFO_PREVENT_AGE_BELOW_18_ENTRIES;

-- Part – B
-- 7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update
-- that age in Person table.

CREATE OR ALTER TRIGGER TR_PERSONINFO_INSERT_CALCULATE_AGE
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN

    INSERT INTO PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
    SELECT PersonID,PersonName,Salary,JoiningDate,City,DATEDIFF(YEAR,BirthDate,GETDATE()),BirthDate FROM inserted
END

DROP TRIGGER TR_PERSONINFO_INSERT_CALCULATE_AGE

-- 8. Create a Trigger to Limit Salary Decrease by a 10%.

CREATE OR ALTER TRIGGER TR_PERSONINFO_LIMIT_SALARY_DECREASE
ON PERSONINFO
INSTEAD OF UPDATE
AS
BEGIN
    INSERT INTO PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
    SELECT PersonID,PersonName,Salary,JoiningDate,City,AGE,BirthDate FROM inserted
    WHERE Salary > (SELECT Salary FROM deleted)
END


DROP TRIGGER TR_PERSONINFO_LIMIT_SALARY_DECREASE;
-- Part – C
-- 9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL
-- during an INSERT.
CREATE OR ALTER TRIGGER TR_PERSONINFO_UPDATE_JOININGDATE_CURRENTDATE
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @JOININGDATE DATETIME

    SELECT @JOININGDATE = JoiningDate FROM inserted

    IF (@JOININGDATE IS NULL)
    BEGIN
        SET @JOININGDATE = GETDATE()
    END
    
    INSERT INTO PersonInfo (PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate)
    SELECT PersonID,PersonName,Salary,@JoiningDate,City,AGE,BirthDate FROM inserted      
END

DROP TRIGGER TR_PERSONINFO_UPDATE_JOININGDATE_CURRENTDATE
-- 10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints
-- ‘Record deleted successfully from PersonLog’.

CREATE TRIGGER TR_PERSONLOG_DELETE
ON PERSONLOG
AFTER DELETE
AS
BEGIN
    PRINT 'RECORD DELETED SUCCESSFULLY';
END
