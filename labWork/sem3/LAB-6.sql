-- CREATE DATABASE CSE_3A_218;
-- USE CSE_3A_218;


-- Math functions
-- Part – A:
-- 1. Display the result of 5 multiply by 30.
        SELECT 5*30;
-- 2. Find out the absolute value of -25, 25, -50 and 50.
        SELECT ABS(-25),ABS(25),ABS(-50),ABS(50);
-- 3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
        SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2);
-- 4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
        SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2)
-- 5. Find out remainder of 5 divided 2 and 5 divided by 3.
        SELECT 5%2 , 5%3;
-- 6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
        SELECT POWER(3,2),POWER(4,3);
-- 7. Find out the square root of 25, 30 and 50.
        SELECT SQRT(25),SQRT(30),SQRT(50);
-- 8. Find out the square of 5, 15, and 25.
        SELECT SQUARE(5),SQUARE(15),SQUARE(25);
-- 9. Find out the value of PI.
        SELECT PI();
-- 10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
        SELECT ROUND(157.732,2) , ROUND(157.732,-2) , ROUND(157.732,0);
-- 11. Find out exponential value of 2 and 3.
        SELECT EXP(2),EXP(3);

-- 12. Find out logarithm having base e of 10 and 2.
        SELECT LOG(10) , LOG(2);
-- 13. Find out logarithm having base b having value 10 of 5 and 100.
        SELECT LOG(5,10) , LOG(100,10);
-- 14. Find sine, cosine and tangent of 3.1415.
        SELECT SIN(3.1415),COS(3.1415),TAN(3.1415);
-- 15. Find sign of -25, 0 and 25.
        SELECT SIGN(-25),SIGN(0),SIGN(25);
-- 16. Generate random number using function.
        SELECT RAND();

        -- Part – B:

        CREATE TABLE EMP_MASTER(
            EMPNO INT,
            EMPNAME VARCHAR(35),
            JOININGDATE DATE,
            SALARY DECIMAL(8,2),
            Commission INT,
            City VARCHAR(35),
            DEPTCODE NVARCHAR(30)
        );

        SELECT * FROM EMP_MASTER;
        -- TRUNCATE TABLE EMP_MASTER;
        INSERT INTO EMP_MASTER VALUES (101,'Keyur','2005-1-02',12000.00,4500,'Rajkot','3@g');
        INSERT INTO EMP_MASTER VALUES (102,'Hardik','2015-2-04',14000.00,2500,'Ahmedabad','3@');
        INSERT INTO EMP_MASTER VALUES (103,'Kajal','2014-3-06',15000.00,3000,'Baroda','3-GD');
        INSERT INTO EMP_MASTER VALUES (104,'Bhoomi','2023-6-05',12500.00,1000,'Ahmedabad','1A3D');
        INSERT INTO EMP_MASTER VALUES (105,'Harmit','2015-2-04',14000.00,2000,'Rajkot','312A');


        -- 1. Display the result of Salary plus Commission.
        SELECT SALARY+COMMISSION AS SALARY_COMMISSION FROM EMP_MASTER;
        -- 2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
        SELECT FLOOR(55.2),FLOOR(35.7),FLOOR(-55.2);
        -- 3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
        SELECT CEILING(55.2),CEILING(35.7),CEILING(-55.2);
        -- 4. Find out remainder of 55 divided 2 and 55 divided by 3.
        SELECT 55%2,55%3;
        -- 5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
        SELECT POWER(23,2),POWER(14,3);


        -- Part – C:
        -- 1. Find out the square root of 36, 49 and 81.
        SELECT SQRT(36),SQRT(49),SQRT(81);
        -- 2. Find out the square of 3, 9, and 12.
        SELECT SQUARE(3),SQUARE(9),SQUARE(12);
        -- 3. Find out round value of 280.8952 for 2, 0 and -2 decimal points.
        SELECT ROUND(280.8952,2),ROUND(280.8952,0),ROUND(280.8952,-2);
        -- 4. Find sine, cosine and tangent of 4.2014.
        SELECT SIN(4.2014),COS(4.2014),TAN(4.2014);
        -- 5. Find sign of -55, 0 and 95.
        SELECT SIGN(-55),SIGN(0),SIGN(95);

--         String functions
--         Part – A:
--         1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
            SELECT LEN(NULL),LEN('HELLO'),LEN('');
--         2. Display your name in lower & upper case.
            SELECT UPPER('OM'),LOWER('OM')
--         3. Display first three characters of your name.
            SELECT SUBSTRING('OM1 BHUT',1,3);
            SELECT LEFT('OM1 BHUT',3);
--         4. Display 3rd to 10th character of your name.
            SELECT SUBSTRING('OM1 BHUT1234',3,7);
--         5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
            SELECT REPLACE('ABC123EFG','ABC123EFG','abcXYZefg');
            SELECT REPLACE('abcabcabc','abcabcabc','ab5ab5ab5');
--         6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
            SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII(0),ASCII(9);
            SELECT ASCII(11);
--             SELECT ASCII(1);
--         7. Write a query to display character based on number 97, 65,122,90,48,57.
            SELECT CONVERT(VARCHAR(5),97),CAST(65 AS VARCHAR(5)),CONVERT(VARCHAR(5),122),CAST(90 AS VARCHAR(5)),CONVERT(VARCHAR(5),40),CAST(57 AS VARCHAR(5));
--         8. Write a query to remove spaces from left of a given string ‘hello world ‘.
            SELECT LTRIM('   HELLO WORLD  ');
--         9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
            SELECT RTRIM('  HELLO WORLD ');
--         10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
            SELECT LEFT('SQL SERVER',4),RIGHT('SQL SERVER',5);
--         11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
            SELECT CAST('1234.56' AS FLOAT);
            SELECT CONVERT(FLOAT,'1234.56');
--         12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
            SELECT CAST(10.58 AS INT);
            SELECT CONVERT(INT,10.58);
--         13. Put 10 space before your name using function.
            SELECT SPACE(10)+'OM';
--         14. Combine two strings using + sign as well as CONCAT ().
            SELECT 'OM'+' BHUT';
            SELECT CONCAT('OM',' BHUT');
--         15. Find reverse of “Darshan”.
            SELECT REVERSE('DARSHAN');
--         16. Repeat your name 3 times.
            SELECT REPLICATE('OM ',3);
            SELECT * FROM EMP_MASTER;
--         Part – B: Perform following queries on Student table of practical no 5.
--         1. Find the length of FirstName and LastName columns.
            SELECT EMPNAME, LEN(EMPNAME) AS LENGTH FROM EMP_MASTER;
--         2. Display FirstName and LastName columns in lower & upper case.
            SELECT EMPNAME,UPPER(EMPNAME) AS UPP,LOWER(EMPNAME) AS LOW FROM EMP_MASTER;
--         3. Display first three characters of FirstName column.
            SELECT LEFT(EMPNAME,3) FROM EMP_MASTER;
--         4. Display 3rd to 10th character of Website column.
            SELECT  SUBSTRING(CITY,3,7) FROM EMP_MASTER;
--         5. Write a query to display first 4 & Last 5 characters of Website column.
            SELECT  LEFT(CITY,4),RIGHT(CITY,5) FROM EMP_MASTER;
--         Part – C: Perform following queries on Student table of practical no 5.
--         1. Put 10 space before FirstName using function.
            SELECT CONCAT(SPACE(10),EMPNAME) FROM EMP_MASTER;
--         2. Combine FirstName and LastName columns using + sign as well as CONCAT ().
            SELECT EMPNAME+ City FROM EMP_MASTER;
            SELECT CONCAT(EMPNAME,CITY) FROM EMP_MASTER;
--         3. Combine all columns using + sign as well as CONCAT ().
            SELECT CAST(EMPNO AS CHAR(3))+EMPNAME+ CONVERT(VARCHAR(10),JOININGDATE)+CONVERT(VARCHAR(10),SALARY)+ CONVERT(VARCHAR(10),Commission) +CITY+DEPTCODE FROM EMP_MASTER;
--         4. Find reverse of FirstName column.
            SELECT REVERSE(EMPNAME) FROM EMP_MASTER;
--         5. Repeat FirstName column 3 times
            SELECT REPLICATE(EMPNAME,3) FROM EMP_MASTER;
--         6. Give the Names which contains 5 characters.
            SELECT EMPNAME FROM EMP_MASTER WHERE LEN(EMPNAME)=5;
--         7. Combine the result as <FirstName> Lives in <City>.
            SELECT EMPNAME + ' LIVES IN ' + CITY FROM EMP_MASTER;
--         8. Combine the result as Student_ID of < FirstName > is <StuID> .
            SELECT 'EMP_ID OF ' + CONVERT(VARCHAR(10),EMPNAME)  + ' IS ' +  CONVERT(CHAR(10),EMPNO)  FROM EMP_MASTER;
            SELECT * FROM EMP_MASTER;



--         Date Functions
--         Part – A:
--         1. Write a query to display the current date & time. Label the column Today_Date.
            SELECT GETDATE() AS TODAY_DATE;
--         2. Write a query to find new date after 365 day with reference to today.
            SELECT DATEADD(day,365,GETDATE());
--         3. Display the current date in a format that appears as may 5 1994 12:00AM.
            SELECT FORMAT(GETDATE(),'MMMM d yyyy h:mm') AS FORMATED_DATE;
            SELECT FORMAT(GETDATE(), 'MMMM d yyyy h:mm tt') AS formatted_date;

--         4. Display the current date in a format that appears as 03 Jan 1995.
            SELECT FORMAT(GETDATE(),'d MMMM yyyy');
--         5. Display the current date in a format that appears as Jan 04, 96.
            SELECT FORMAT(GETDATE(),'MMMM d,yy');
--         6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
            SELECT DATEDIFF(MONTH ,'2008-Dec-31','2009-Mar-31');
--         7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
            SELECT DATEDIFF(YEAR ,'2012-JAN-25','2010-SEP-14');
--         8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
            SELECT DATEDIFF(HOUR,'25-JAN-12','26-JAN-12');
--         9. Write a query to extract Day, Month, Year from given date 12-May-16.
            SELECT DATEPART(DAY , '12-MAY-16'),DATEPART(MONTH , '12-MAY-16'),DATEPART(YEAR , '12-MAY-16');
--         10. Write a query that adds 5 years to current date.
            SELECT DATEADD(d,5,GETDATE());
--         11. Write a query to subtract 2 months from current date.
            SELECT DATEADD(m,-2,GETDATE());
--         12. Extract month from current date using datename () and datepart () function.
            SELECT DATENAME(MONTH , GETDATE()),DATEPART(MONTH ,GETDATE());
--         13. Write a query to find out last date of current month.
            SELECT EOMONTH(GETDATE());
        -- 14. Calculate your age in years and months.
            SELECT DATEDIFF(YEAR,'01-JULY-05',GETDATE()) AS YEAR;    
            SELECT DATEDIFF(MONTH,'01-JULY-05',GETDATE()) AS MONTH;
--             Part – B:

            -- Create the EMP_DETAIL table
                CREATE TABLE EMP_DETAIL (
                    EmpNo INT,
                    EmpName VARCHAR(50),
                    JoiningDate DATE,
                    Salary DECIMAL(10, 2),
                    City VARCHAR(50)
                );

                -- Insert the records into the EMP_DETAIL table
                INSERT INTO EMP_DETAIL (EmpNo, EmpName, JoiningDate, Salary, City)
                VALUES
                    (101, 'Keyur', '2002-01-15', 12000.00, 'Rajkot'),
                    (102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad'),
                    (103, 'Kajal', '2006-03-14', 15000.00, 'Baroda'),
                    (104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad'),
                    (105, 'Harmit', '2004-02-15', 14000.00, 'Rajkot'),
                    (106, 'Jay', '2007-03-12', 12000.00, 'Surat');

--             SELECT * FROM EMP_DETAIL;

--                 1. Write a query to find new date after 365 day with reference to JoiningDate.
                    SELECT DATEADD(DAY ,365,JOININGDATE) FROM EMP_DETAIL;
--                 2. Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
                    SELECT FORMAT(GETDATE(),'d MMM yyyy  hh:mm:ss tt') FROM EMP_DETAIL;
--                 3. Display the JoiningDate in a format that appears as 03 Jan 1995.
                    SELECT FORMAT(JOININGDATE,'d MMM, yyyy') FROM EMP_DETAIL;
--                 4. Display the JoiningDate in a format that appears as Jan 04, 96.
                    SELECT FORMAT(JOININGDATE,'MMM d, yy') FROM EMP_DETAIL;
                --     SELECT FORMAT(JOININGDATE,'d MMMM,')
--                 5. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
                    SELECT DATEDIFF(MONTH ,JOININGDATE,'31-MAR-09') FROM EMP_DETAIL;
--                 6. Write a query to find out total number of years between JoiningDate and 14-Sep-10
                    SELECT DATEDIFF(YEAR ,JOININGDATE,'14-Sep-10') FROM EMP_DETAIL;
                    SELECT * FROM EMP_DETAIL;    
--                 Part – C:
--                 1. Write a query to extract Day, Month, Year from JoiningDate.
                     SELECT DATEPART(DAY,JOININGDATE) AS DAY,DATEPART(MONTH,JOININGDATE) AS MONTH,DATEPART(YEAR,JOININGDATE) AS MONTH , DATEPART(YEAR,JOININGDATE) AS YEAR FROM EMP_DETAIL;
--                 2. Write a query that adds 5 years to JoiningDate.
                     SELECT DATEADD(YEAR,5,JOININGDATE) AS ADDEDYEAR FROM EMP_DETAIL;
--                 3. Write a query to subtract 2 months from JoiningDate.
                     SELECT DATEADD(MONTH,-2,JOININGDATE) AS ADDEDMONTH FROM EMP_DETAIL;
--                 4. Extract month from JoiningDate using datename () and datepart () function.
                    SELECT DATENAME(MONTH ,JOININGDATE) FROM EMP_DETAIL;
                    SELECT DATEPART(MONTH ,JOININGDATE) FROM EMP_DETAIL;
--                 5. Calculate your age in years and months
                        

SELECT
    EmpNo,
    EmpName,
    JoiningDate,
    DATENAME(MONTH, JoiningDate) AS MonthName,
    DATEPART(MONTH, JoiningDate) AS MonthNumber
FROM EMP_DETAIL;

SELECT
    EmpNo,
    EmpName,
    DAY(JoiningDate) AS JoiningDay,
    MONTH(JoiningDate) AS JoiningMonth,
    YEAR(JoiningDate) AS JoiningYear
FROM EMP_DETAIL;

SELECT
    EmpNo,
    EmpName,
    JoiningDate,
    DATEADD(YEAR, 5, JoiningDate) AS JoiningDatePlus5Years
FROM EMP_DETAIL;

SELECT
    EmpNo,
    EmpName,
    JoiningDate,
    DATEADD(MONTH, -2, JoiningDate) AS JoiningDateMinus2Months
FROM EMP_DETAIL;

SELECT
    EmpNo,
    EmpName,
    JoiningDate,
    DATENAME(MONTH, JoiningDate) AS MonthName,
    DATEPART(MONTH, JoiningDate) AS MonthNumber
FROM EMP_DETAIL;