CREATE TABLE Stu_Info (
    Rno INT ,
    Name VARCHAR(50),
    Branch VARCHAR(50)
);

INSERT INTO Stu_Info (Rno, Name, Branch)
VALUES 
    (101, 'Raju', 'CE'),
    (102, 'Amit', 'CE'),
    (103, 'Sanjay', 'ME'),
    (104, 'Neha', 'EC'),
    (105, 'Meera', 'EE'),
    (106, 'Mahesh', 'ME');

CREATE TABLE Result (
	RNO INT,
    SPI DECIMAL(4, 2),
	);

INSERT INTO Result (Rno, SPI)
VALUES 
    (101, 8.8),
    (102, 9.2),
    (103, 7.6),
    (104, 8.2),
    (105, 7.0),
    (107, 8.9);  

CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(50) ,
    Name VARCHAR(50),
    ManagerNo VARCHAR(50)
);

INSERT INTO EMPLOYEE_MASTER(EmployeeNo, Name, ManagerNo)
VALUES 
    ('E01', 'Tarun', NULL),
    ('E02', 'Rohan', 'E02'),
    ('E03', 'Priya', 'E01'),
    ('E04', 'Milan', 'E03'),
    ('E05', 'Jay', 'E01'),
    ('E06', 'Anjana', 'E04');


                -- 1. Combine information from student and result table using cross join or Cartesian product.
            SELECT *  
            FROM Stu_Info 
            CROSS JOIN Result;

            -- 2. Perform inner join on Student and Result tables.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            INNER JOIN Result  
            ON Stu_Info.Rno = Result.Rno;

            -- 3. Perform the left outer join on Student and Result tables.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            LEFT OUTER JOIN Result  
            ON Stu_Info.Rno = Result.Rno;

            -- 4. Perform the right outer join on Student and Result tables.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            RIGHT OUTER JOIN Result  
            ON Stu_Info.Rno = Result.Rno;

            -- 5. Perform the full outer join on Student and Result tables.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            FULL OUTER JOIN Result  
            ON Stu_Info.Rno = Result.Rno;

            -- 6. Display Rno, Name, Branch and SPI of all students.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            LEFT OUTER JOIN Result  
            ON Stu_Info.Rno = Result.Rno;

            -- 7. Display Rno, Name, Branch and SPI of CE branch’s student only.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            INNER JOIN Result  
            ON Stu_Info.Rno = Result.Rno 
            WHERE Stu_Info.Branch = 'CE';

            -- 8. Display Rno, Name, Branch and SPI of students not in the EC branch.
            SELECT  
            Stu_Info.Rno,  
            Stu_Info.Name,  
            Stu_Info.Branch,  
            Result.SPI  
            FROM Stu_Info  
            INNER JOIN Result  
            ON Stu_Info.Rno = Result.Rno 
            WHERE Stu_Info.Branch != 'EC';

            -- 9. Display the average result of each branch.
            SELECT  
            Stu_Info.Branch, 
            AVG(Result.SPI)  
            FROM Stu_Info  
            INNER JOIN Result  
            ON Stu_Info.Rno = Result.Rno 
            GROUP BY Stu_Info.Branch;

            -- 10. Display the average result of CE and ME branches.
            SELECT  
            Stu_Info.Branch, 
            AVG(Result.SPI) AS Average_SPI 
            FROM Stu_Info  
            INNER JOIN Result  
            ON Stu_Info.Rno = Result.Rno 
            WHERE Stu_Info.Branch IN ('CE', 'ME') 
            GROUP BY Stu_Info.Branch;



-- Part – B:
-- 1. Display average result of each branch and sort them in ascending order by SPI.
        SELECT AVG(R.SPI) AS AVG_RESULT FROM Stu_Info S 
        JOIN Result R 
        ON S.Rno = R.RNO
        GROUP BY S.Branch
        ORDER BY AVG(R.SPI) 

-- 2. Display highest SPI from each branch and sort them in descending order.
        SELECT MAX(R.SPI) AS MAX_RESULT FROM Stu_Info S
        JOIN Result R
        ON S.Rno = R.RNO
        GROUP BY S.Branch
        ORDER BY MAX(R.SPI) DESC

-- Part – C:
-- 1. Retrieve the names of employee along with their manager’s name from the Employee table.

    SELECT E1.Name AS MANAGER_NAME , E2.Name AS EMP_NAME FROM EMPLOYEE_MASTER E1
    JOIN EMPLOYEE_MASTER E2 
    ON E1.EmployeeNo = E2.ManagerNo
