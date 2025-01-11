-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


SELECT name, compatibility_level
FROM sys.databases;


-- From the above given tables create Stored Procedures:
-- Part – A
-- 1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_INSERT
@DepartmentID INT,
@DepartmentName VARCHAR(100)
AS
BEGIN
    INSERT INTO Department
    VALUES (@DepartmentID,@DepartmentName)
END

PR_DEPARTMENT_INSERT 1,'ADMIN'
PR_DEPARTMENT_INSERT 2,'IT'
PR_DEPARTMENT_INSERT 3,'HR'
PR_DEPARTMENT_INSERT 4,'ACCOUNT'

SELECT * FROM Department

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_UPDATE
@DEPARTMENTID INT,
@DepartmentName VARCHAR(100)
AS
BEGIN
    UPDATE Department
    SET DepartmentName = @DepartmentName
    WHERE DepartmentID = @DEPARTMENTID
END

PR_DEPARTMENT_UPDATE 1,'ADMIN2'
SELECT * FROM Department

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DELETE
@DEPARTMENTID INT
AS
BEGIN
    DELETE FROM Department
    WHERE DepartmentID=@DEPARTMENTID
END

PR_DEPARTMENT_DELETE 4

CREATE OR ALTER PROCEDURE PR_DESIGNATION_INSERT
@DESIGNATIONID INT,
@DesignationName VARCHAR(100)
AS
BEGIN
    INSERT INTO Designation
    VALUES (@DESIGNATIONID,@DesignationName)
END

SELECT * FROM Designation

PR_DESIGNATION_INSERT 11,'Jobber'
PR_DESIGNATION_INSERT 12,'Welder'
PR_DESIGNATION_INSERT 13,'Clerk'
PR_DESIGNATION_INSERT 14,'Manager'
PR_DESIGNATION_INSERT 15,'CEO'

CREATE OR ALTER PROCEDURE PR_DESIGNATION_UPDATE
@DESIGNATIONID INT,
@DesignationName VARCHAR(100)
AS
BEGIN
    UPDATE Designation
    SET DesignationName=@DesignationName
    WHERE DesignationID=@DESIGNATIONID
END

SELECT * FROM Designation

PR_DESIGNATION_UPDATE 11,'JOBBER1'

CREATE OR ALTER PROCEDURE PR_DESIGNATION_DELETE
@DESIGNATIONID INT
AS
BEGIN
    DELETE FROM Designation
    WHERE DesignationID=@DESIGNATIONID
END


PR_DESIGNATION_DELETE 11

CREATE OR ALTER PROCEDURE PR_PERSON_INSERT
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@Salary Decimal (8,2),
@JoiningDate DATETIME,
@DepartmentID INT,
@DesignationID INT
AS
BEGIN
    INSERT Person
    VALUES(@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
END

SELECT * FROM Person

PR_PERSON_INSERT 'Rahul','Anshu',56000,'01-01-1990',1,12
PR_PERSON_INSERT 'Hardik','Hinsu',18000,'1990-09-25 ',2,11
PR_PERSON_INSERT 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
PR_PERSON_INSERT 'Bhoomi','Patel',39000,'2014-02-20',1,13
PR_PERSON_INSERT 'Priya','Mehta',25000,'1990-10-18',2,NULL
PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15

CREATE OR ALTER PROCEDURE PR_PERSON_UPDATE
@FirstName VARCHAR(100),
@LastName VARCHAR(100),
@PersonID INT
AS
BEGIN
    UPDATE Person
    SET FirstName=@FirstName,
    LastName=@LastName
    WHERE PersonID=@PersonID
END

PR_PERSON_UPDATE 'Rahul','ANSHUJI',101

CREATE OR ALTER PROCEDURE PR_PERSON_DELETE
@PersonID INT
AS
BEGIN
    DELETE FROM Person
    WHERE PersonID=@PersonID
END

PR_PERSON_DELETE 107
TRUNCATE TABLE PERSON


-- 2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY`
CREATE OR ALTER PROCEDURE PR_Department_SELECTBYPRIMARYKEY
@DepartmentID INT
AS
BEGIN
    SELECT * FROM Department
    WHERE DepartmentID=@DepartmentID
END

PR_Department_SELECTBYPRIMARYKEY 2;

CREATE OR ALTER PROCEDURE PR_PERSON_SELECTBYPRIMARYKEY
@PERSONID INT
AS
BEGIN
    SELECT * FROM Person 
    WHERE PersonID=@PERSONID
END

PR_PERSON_SELECTBYPRIMARYKEY 102

CREATE OR ALTER PROCEDURE PR_DESIGNATION_SELECTBYPRIMARYKEY
@DesignationID INT 
AS
BEGIN
    SELECT * FROM Designation
    WHERE DesignationID=@DesignationID
END

PR_DESIGNATION_SELECTBYPRIMARYKEY 12
-- 3. Department, Designation & Person Table’s (If foreign key is available then do write join and take
-- columns on select list)
CREATE OR ALTER PROCEDURE PR_DETAILS_SELECT
@PERSONID INT
AS
BEGIN
    SELECT P.*,D1.DepartmentName,D2.DesignationName FROM Person P 
    join Department D1 ON P.DepartmentID = D1.DepartmentID
    JOIN Designation D2 ON P.DesignationID = D2.DesignationID
    WHERE P.PersonID = @PERSONID
END
PR_DETAILS_SELECT 101
-- 4. Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER PROCEDURE PR_DETAILS_FIRST_THREE
AS
BEGIN 
    SELECT TOP 3 P.*,D1.DepartmentName,D2.DesignationName FROM Person P 
    join Department D1 ON P.DepartmentID = D1.DepartmentID
    JOIN Designation D2 ON P.DesignationID = D2.DesignationID
END

-- Part – B
-- 5. Create a Procedure that takes the department name as input and returns a table with all workers
-- working in that department.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_WORKERS
@DepartmentName VARCHAR(100)
AS
BEGIN
    SELECT * FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    WHERE D.DepartmentName = @DepartmentName
END

PR_DEPARTMENT_WORKERS 'ADMIN'
-- 6. Create Procedure that takes department name & designation name as input and returns a table with
-- worker’s first name, salary, joining date & department name.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_DESIGNATION_WORKERS
@DepartmentName VARCHAR(100),
@DesignationName VARCHAR(100)
AS
BEGIN
    SELECT P.FirstName,P.Salary,P.JoiningDate,D.DepartmentName FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    JOIN Designation D2 ON P.DesignationID=D2.DesignationID
    WHERE D.DepartmentName=@DepartmentName and D2.DesignationName=@DesignationName
END 



PR_DEPARTMENT_DESIGNATION_WORKERS 'IT','JOBBER1'
-- 7. Create a Procedure that takes the first name as an input parameter and display all the details of the
-- worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_PERSON_FIRSTNAME
@FirstName VARCHAR(100)
AS
BEGIN
    SELECT P.FirstName,P.Salary,P.JoiningDate,D.DepartmentName,D2.DesignationName FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    JOIN Designation D2 ON P.DesignationID=D2.DesignationID
    WHERE P.FirstName = @FirstName
END 

PR_PERSON_FIRSTNAME 'RAHUL'
-- 8. Create Procedure which displays department wise maximum, minimum & total salaries.

CREATE OR ALTER PROCEDURE PR_DEPARTMENT_MAX_MIN_SUM
AS
BEGIN
    SELECT D.DepartmentName,MAX(P.Salary),MIN(P.Salary),SUM(P.Salary) FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    GROUP BY D.DepartmentName
END

-- 9. Create Procedure which displays designation wise average & total salaries.

CREATE OR ALTER PROCEDURE PR_DESIGNATION_MAX_MIN_SUM
AS
BEGIN
    SELECT D.DesignationName,AVG(P.Salary) AVG_SALARY,SUM(P.Salary) AS SUM FROM PERSON P
    JOIN Designation D ON P.DesignationID = D.DesignationID
    GROUP BY D.DesignationName 
END

SELECT * FROM Person

-- Part – C
-- 10. Create Procedure that Accepts Department Name and Returns Person Count.

CREATE OR ALTER PROCEDURE PR_PERSONCOUNT
@DepartmentName VARCHAR(100)
AS
BEGIN
    SELECT COUNT(*) AS PERSON_COUNT FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    WHERE D.DepartmentName = @DepartmentName
END

PR_PERSONCOUNT 'ADMIN'
-- 11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than
-- input salary value along with their department and designation details.

CREATE OR ALTER PROCEDURE PR_SALARYGT
@Salary INT 
AS
BEGIN
    SELECT P.FirstName,P.Salary,P.JoiningDate,D.DepartmentName,D2.DesignationName FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    JOIN Designation D2 ON P.DesignationID=D2.DesignationID
    WHERE P.Salary > @Salary
END

PR_SALARYGT 55000

-- 12. Create a procedure to find the department(s) with the highest total salary among all departments.

-- CREATE OR ALTER PROCEDURE PR_HIGHEST_SALARY
-- AS
-- BEGIN
--         SELECT TOP 1 D.DepartmentName,SUM(P.Salary) AS TOTAL_SALARY FROM Person P 
--         JOIN Department D ON P.DepartmentID=D.DepartmentID
--         GROUP BY D.DepartmentName
--         ORDER BY SUM(P.Salary) DESC 
-- END

CREATE OR ALTER PROCEDURE PR_HIGHEST_SALARY
AS
BEGIN
    -- Find the highest total salary among all departments
    DECLARE @MaxSalary INT;

    SELECT @MaxSalary = MAX(TOTAL_SALARY)
    FROM (
        SELECT SUM(P.Salary) AS TOTAL_SALARY
        FROM Person P
        JOIN Department D ON P.DepartmentID = D.DepartmentID
        GROUP BY D.DepartmentName
    ) AS SalaryData;

    -- Retrieve all departments with the highest total salary
    SELECT D.DepartmentName, SUM(P.Salary) AS TOTAL_SALARY
    FROM Person P
    JOIN Department D ON P.DepartmentID = D.DepartmentID
    GROUP BY D.DepartmentName
    HAVING SUM(P.Salary) = @MaxSalary;
END;


-- 13. Create a procedure that takes a designation name as input and returns a list of all workers under that
-- designation who joined within the last 10 years, along with their department.

CREATE OR ALTER PROCEDURE PR_DESIGNATION_LAST_10_YEAR
@DesignationName VARCHAR(100)
AS
BEGIN
    SELECT * FROM Person P 
    JOIN Designation D ON P.DesignationID=D.DesignationID
    JOIN Department D2 ON P.DepartmentID=D2.DepartmentID
    WHERE D.DesignationName=@DesignationName AND DATEDIFF(YEAR, P.JoiningDate, GETDATE())<=10
END

PR_DESIGNATION_LAST_10_YEAR 'CEO'

-- 14. Create a procedure to list the number of workers in each department who do not have a designation
-- assigned.

CREATE OR ALTER PROCEDURE PR_NO_DESIGNATION
AS
BEGIN
    SELECT * FROM Person
    WHERE DesignationID IS NULL
END

-- 15. Create a procedure to retrieve the details of workers in departments where the average salary is above
-- 12000.

CREATE OR ALTER PROCEDURE PR_AVG_SALARY_ABOVE_12000
AS
BEGIN
    SELECT P.FirstName,D.DepartmentName FROM Person P 
    JOIN Department D ON P.DepartmentID=D.DepartmentID
    WHERE D.DepartmentName IN (
        SELECT d.DepartmentName FROM Person P 
        JOIN Department D ON P.DepartmentID=D.DepartmentID
        GROUP BY D.DepartmentName
        HAVING AVG(P.Salary)>12000
    )
END
    


CREATE OR ALTER PROCEDURE PR_AVG_SALARY_ABOVE_12000
AS
BEGIN
    SELECT 
        P.FirstName,
        D.DepartmentName
    FROM 
        Person P
    JOIN 
        Department D 
    ON 
        P.DepartmentID = D.DepartmentID
    JOIN 
        (SELECT 
            D.DepartmentID
         FROM 
            Person P
         JOIN 
            Department D 
         ON 
            P.DepartmentID = D.DepartmentID
         GROUP BY 
            D.DepartmentID
         HAVING 
            AVG(P.Salary) > 12000) AS HighSalaryDepartments
    ON 
        D.DepartmentID = HighSalaryDepartments.DepartmentID;
END;

