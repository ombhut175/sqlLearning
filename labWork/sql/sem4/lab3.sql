CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE,
 ManagerID INT NOT NULL,
 Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employee (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 DoB DATETIME NOT NULL,
 Gender VARCHAR(50) NOT NULL,
 HireDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 Salary DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Projects Table
CREATE TABLE Projects (
 ProjectID INT PRIMARY KEY,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location)
VALUES
 (1, 'IT', 101, 'New York'),
 (2, 'HR', 102, 'San Francisco'),
 (3, 'Finance', 103, 'Los Angeles'),
 (4, 'Admin', 104, 'Chicago'),
 (5, 'Marketing', 105, 'Miami');
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID,
Salary)
VALUES
 (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
 (102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
 (103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
 (104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
 (105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES
 (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
 (202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
 (203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
 (204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
 (205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);


--  Part – A
-- 1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based
-- on this you must give EmployeeID, DOB, Gender & Hiredate.
CREATE OR ALTER PROCEDURE PR_EMPLOYEE_FIRST_LAST_NAME
@FirstName VARCHAR(50) = NULL,
@LastName VARCHAR(50) = NULL
AS
BEGIN
    SELECT e.EmployeeID,E.DoB,E.Gender,E.HireDate FROM Employee E
    WHERE E.FirstName = @FirstName
    OR E.LastName = @LastName
END


PR_EMPLOYEE_FIRST_LAST_NAME NULL,'DOE'
-- 2. Create a Procedure that will accept Department Name and based on that gives employees list who
-- belongs to that department. 
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_WISE_EMPLOYEE_INFO
@DepartmentName VARCHAR(50)
AS
BEGIN
    SELECT E.FirstName,E.EmployeeID,E.DoB,E.Gender,E.HireDate FROM Employee E
    join DepartmentS D ON E.DepartmentID = D.DepartmentID
    WHERE D.DepartmentName = @DepartmentName
END

PR_DEPARTMENT_WISE_EMPLOYEE_INFO 'IT'
-- 3. Create a Procedure that accepts Project Name & Department Name and based on that you must give
-- all the project related details.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_PROJECT_DETAILS
@ProjectName VARCHAR(50),
@DepartmentName VARCHAR(50)
AS
BEGIN
    SELECT P.* FROM DepartmentS D
    join Projects P ON D.DepartmentID = P.DepartmentID
    WHERE P.ProjectName = @ProjectName
    AND D.DepartmentName = @DepartmentName
END


PR_DEPARTMENT_PROJECT_DETAILS 'Project Alpha','IT'
-- 4. Create a procedure that will accepts any integer and if salary is between provided integer, then those
-- employee list comes in output.
CREATE OR  ALTER PROCEDURE PR_SALARY_RANGE
@MIN INT,
@MAX INT
AS
BEGIN
    SELECT * FROM Employee E
    WHERE E.Salary BETWEEN @MIN AND @MAX
END

PR_SALARY_RANGE 70000,83000
-- 5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date.
CREATE OR ALTER PROCEDURE PR_DATE_DETAILS
@HIREDATE DATETIME
AS
BEGIN
    SELECT * FROM Employee E 
    WHERE E.HireDate = @HIREDATE
END

SELECT * FROM Employee

PR_DATE_DETAILS '2010-06-15 00:00:00.000'

-- Part – B
-- 6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be
-- served.
CREATE OR ALTER PROCEDURE PR_GENDER_EMPLOYEE_DETAILS
@FIRSTLETTER VARCHAR(1)
AS
BEGIN
    SELECT * FROM Employee E 
    WHERE E.Gender LIKE @FIRSTLETTER+'%' 
END 

PR_GENDER_EMPLOYEE_DETAILS 'M'
-- 7. Create a Procedure that accepts First Name or Department Name as input and based on that employee
-- data will come.
CREATE OR ALTER PROCEDURE PR_FIRST_OR_DEPT_DETAILS
@FirstName VARCHAR(50) = NULL,
@DepartmentName VARCHAR(50) = NULL
AS
BEGIN
    SELECT * FROM Employee E 
    JOIN Departments D ON E.DepartmentID = D.DepartmentID
    WHERE E.FirstName = @FirstName
    OR D.DepartmentName = @DepartmentName
END

PR_FIRST_OR_DEPT_DETAILS NULL,'IT'
-- 8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will
-- get all the departments with all data.
CREATE OR ALTER PROCEDURE PR_DETAILS_FROM_LOCATION
@LOCATION VARCHAR(50)
AS
BEGIN
    SELECT * FROM Departments D 
    WHERE D.[Location] LIKE '%'+@LOCATION+'%'
END


PR_DETAILS_FROM_LOCATION 'LOS'
    
-- Part – C
-- 9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project
-- related data.
CREATE OR ALTER PROCEDURE PR_DETAILS_PROJECT_FROM_DATE
@STARTDATE DATETIME,
@ENDDATE DATETIME
AS
BEGIN
    SELECT * FROM Projects P 
    WHERE P.StartDate = @STARTDATE
    AND P.EndDate = @ENDDATE
END

PR_DETAILS_PROJECT_FROM_DATE '2022-01-01','2022-12-31'
-- 10. Create a procedure in which user will enter project name & location and based on that you must
-- provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates. 

CREATE OR ALTER PROCEDURE PR_DETAILS_FROM_PNAME_LOCATION
@ProjectName VARCHAR(50),
@LOCATION VARCHAR(50)
AS
BEGIN
    SELECT D.DepartmentName,E.FirstName,P.ProjectName,P.StartDate,P.EndDate FROM Employee E 
    JOIN Departments D ON E.DepartmentID = D.DepartmentID
    JOIN Projects P ON P.DepartmentID = D.DepartmentID
    WHERE P.ProjectName = @ProjectName
    AND D.[Location] = @LOCATION
END

PR_DETAILS_FROM_PNAME_LOCATION 'Project Alpha','New York'