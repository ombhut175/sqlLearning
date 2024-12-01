--Sub Queries--
CREATE TABLE Stu_Detail (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');


    -- Part A

-- 1. Display details of students who are from the computer department.
SELECT *  
FROM Stu_Detail  
WHERE DID = (SELECT DID FROM Department  
             WHERE DNAME = 'COMPUTER');

-- 2. Display names of students whose SPI is more than 8.
SELECT NAME  
FROM Stu_Detail  
WHERE RNO IN (SELECT RNO FROM Academic 
              WHERE SPI > 8);

-- 3. Display details of students from the computer department who belong to Rajkot city.
SELECT NAME, CITY  
FROM Stu_Detail 
WHERE CITY = 'RAJKOT' 
  AND DID = (SELECT DID FROM Department 
             WHERE DNAME = 'COMPUTER');

-- 4. Find total number of students in the electrical department.
SELECT COUNT(RNO)  
FROM Stu_Detail 
WHERE DID = (SELECT DID FROM Department 
             WHERE DNAME = 'ELECTRICAL');

-- 5. Display name of the student who has the maximum SPI.
SELECT NAME  
FROM Stu_Detail  
WHERE RNO = (SELECT RNO FROM Academic 
             WHERE SPI = (SELECT MAX(SPI) FROM Academic));

-- 6. Display details of students having more than 1 backlog.
SELECT NAME, CITY 
FROM Stu_Detail 
WHERE RNO IN (SELECT RNO FROM Academic 
              WHERE BKLOG > 1);



-- Part – B:
-- 1. Display name of students who are either from computer department or from mechanical department.
    SELECT NAME FROM Stu_Detail
    WHERE DID IN (
        SELECT DID FROM Department
        WHERE DName IN ('computer','mechanical')
    )
-- 2. Display name of students who are in same department as 102 studying in.
    SELECT S.Name , S.DID FROM Stu_Detail S
    WHERE S.DID IN (
        SELECT S2.DID FROM Stu_Detail S2
        GROUP BY S2.DID
        HAVING COUNT(S2.DID)>1
    )
    ORDER BY S.DID 
    
-- Part – C:
-- 1. Display name of students whose SPI is more than 9 and who is from electrical department.
    SELECT S.Name FROM Stu_Detail S
    WHERE DID IN (
        SELECT D.DID FROM Department D
        WHERE D.DName='ELECTRICAL'
    ) 
    AND S.Rno IN (
        SELECT A.RNO FROM Academic A 
        WHERE A.SPI>9
    )
-- 2. Display name of student who is having second highest SPI.
        SELECT S.Name FROM Stu_Detail S
        WHERE S.Rno IN (
            SELECT A.RNO FROM Academic A 
            WHERE A.SPI IN (
                SELECT MAX(A2.SPI) FROM Academic A2 
                WHERE A2.SPI<(
                    SELECT MAX(SPI) FROM Academic
                )
            )
        )

    
            SELECT NAME
            FROM Stu_Detail
            WHERE RNO=(SELECT RNO
            FROM ACADEMIC
            WHERE SPI=( SELECT TOP 1
                SPI
            FROM (SELECT DISTINCT TOP 2 SPI
                FROM ACADEMIC
                ORDER BY SPI DESC) AS TEMP
            ORDER BY SPI ASC)
                        );


-- 3. Display city names whose students branch wise SPI is 9.2
        SELECT S.City FROM Stu_Detail S
        WHERE S.Rno IN (
            SELECT A.RNO FROM Academic A 
            WHERE A.SPI = 9.2
        )
        GROUP BY S.DID,S.City


    
