USE CSE_4A_122

-- Lab-4 UDF
-- Note: for Table valued function use tables of Lab-2
-- Part – A
-- 1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_HELLO_WORLD()
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'HELLO WORLD'
END

SELECT dbo.FN_HELLO_WORLD()

-- 2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADDITION_TWO_NUMBER(@NUM1 INT,@NUM2 INT)
RETURNS INT
AS
BEGIN
    RETURN @NUM1 + @NUM2
END

SELECT DBO.FN_ADDITION_TWO_NUMBER(5,7);
-- 3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODD_OR_EVEN(@NUM1 INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @ANS VARCHAR(50)
    IF @NUM1%2 = 0
        SET @ANS = 'EVEN'
    ELSE 
        SET @ANS = 'ODD'
    RETURN @ANS
END 

SELECT DBO.FN_ODD_OR_EVEN(10);

DROP FUNCTION IF EXISTS FN_ODD_OR_EVEN

-- 4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_FIRST_NAME()
RETURNS TABLE
AS
RETURN(
    SELECT * FROM PERSON P
    WHERE P.FIRSTNAME LIKE 'B%'
) 

SELECT * FROM FN_FIRST_NAME();

-- 5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_UNIQUE_FIRST_NAME()
RETURNS TABLE
AS
RETURN(
    SELECT DISTINCT FIRSTNAME FROM PERSON
)

SELECT * FROM DBO.FN_UNIQUE_FIRST_NAME()

-- 6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_PRINT_1_TO_N(@N INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @ANS VARCHAR(MAX)
    DECLARE @I INT
    SET @ANS=''
    SET @I = 1
    WHILE (@I<@N)
    BEGIN
        SET @ANS = @ANS + ' ' + CAST(@I AS VARCHAR)
        SET @I= @I + 1
    END
    RETURN @ANS
END

SELECT DBO.FN_PRINT_1_TO_N(50)
-- 7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FN_FACTORIAL_LOOP(@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @I INT = 1
    DECLARE @ANS INT = 1
    WHILE (@I<=@N)
    BEGIN
        SET @ANS = @ANS*@I
        SET @I = @I+1
    END
    RETURN @ANS
END

SELECT DBO.FN_FACTORIAL_LOOP(5); 

CREATE OR ALTER FUNCTION FN_FACTORIAL_RECURSION(@N INT)
RETURNS INT
AS
BEGIN
    IF (@N = 1)
        RETURN 1
    RETURN @N * FN_FACTORIAL_RECURSION(@N - 1)
END

SELECT * 
FROM sys.objects 
WHERE type = 'FN' AND name = 'FN_FACTORIAL_RECURSION';



-- Part – B
-- 8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_COMPARE_TWO_INTEGERS(@N1 INT , @N2 INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @ANS VARCHAR(50) = ''
    IF (@N1>@N2)
    BEGIN
        SET @ANS = 'N1 IS GREATER'
    END
    ELSE IF (@N1<@N2)
    BEGIN
        SET @ANS = 'N2 IS GREATER'
    END
    ELSE 
    BEGIN
        SET @ANS = 'BOTH ARE EQUAL'
    END
    RETURN @ANS
END

CREATE OR ALTER FUNCTION FN_COMPARE_TWO_INTEGERS_SWITCH_CASE(@N1 INT , @N2 INT)
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN CASE
        WHEN @N1>@N2 THEN 'N1 IS GREATER'
        WHEN @N1<@N2 THEN 'N2 IS GREATER'
        ELSE 'BOTH ARE EQUAL'
    END
END

SELECT DBO.FN_COMPARE_TWO_INTEGERS(5,5)
SELECT DBO.FN_COMPARE_TWO_INTEGERS_SWITCH_CASE(5,7)
-- 9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION FN_SUM_OF_EVEN()
RETURNS INT 
AS
BEGIN
    DECLARE @ANS INT = 0
    DECLARE @I INT = 1
    WHILE(@I<=20)
    BEGIN
        SET @ANS = @ANS + @I
        SET @I = @I + 1
    END
    RETURN @ans
END

SELECT DBO.FN_SUM_OF_EVEN();

-- 10. Write a function that checks if a given string is a palindrome
CREATE OR ALTER FUNCTION FN_CHECK_PALINDROME(@VALUE VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @ANS VARCHAR(50)
    IF @VALUE = REVERSE(@VALUE)
        SET @ANS = 'PALINDROME'
    ELSE 
        SET @ANS = 'NOT'
    RETURN @ANS
END

SELECT DBO.FN_CHECK_PALINDROME('AJAJ')

-- Part – C
-- 11. Write a function to check whether a given number is prime or not.
CREATE OR ALTER FUNCTION FN_PRIME_OR_NOT(@N INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @CHECK INT = 1
    DECLARE @I INT = 2
    -- DECLARE @ANS VARCHAR(50)
    WHILE (@I < @N/2)
    BEGIN
        IF @N%@I = 0
        BEGIN
            -- SET @ANS = 'NOT PRIME'
            RETURN 'NOT PRIME'
        END
        SET @I = @I + 1
    END 
    RETURN 'PRIME'
END

SELECT DBO.FN_PRIME_OR_NOT(7)

-- 12. Write a function which accepts two parameters start date & end date, and returns a difference in days.

CREATE OR ALTER FUNCTION FN_DIFF_DATE(@START DATE,@END DATE)
RETURNS DATE
AS
BEGIN
    DECLARE @ANS DATE
    SET @ANS = DATEDIFF(DAY,@END,@START)
    RETURN @ANS
END


-- 13. Write a function which accepts two parameters year & month in integer and returns total days each
-- year.
CREATE OR ALTER FUNCTION FN_DAYS_OF_MONTH_YEAR(
    @YEAR INT,
    @MONTH INT
)
RETURNS INT
AS
BEGIN
    RETURN DAY(EOMONTH(DATEFROMPARTS(@YEAR,@MONTH,1)));
END

SELECT DBO.FN_DAYS_OF_MONTH_YEAR(2024,2);

-- 14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.

SELECT * FROM Person;

CREATE OR ALTER FUNCTION FN_DETAIL_FROM_DEPTID(@DEPARTMENTID INT)
RETURNS TABLE
AS
RETURN(
    SELECT * FROM Person
    WHERE DepartmentID = @DEPARTMENTID
)

SELECT * FROM FN_DETAIL_FROM_DEPTID(2);

-- 15. Write a function that returns a table with details of all persons who joined after 1-1-1991.

CREATE OR ALTER FUNCTION FN_DETAILS_AFTER_DATE()
RETURNS TABLE
AS
    RETURN(
        SELECT * FROM Person
        WHERE JoiningDate > '1991/1/1'
    )

SELECT * FROM FN_DETAILS_AFTER_DATE();

SELECT EOMONTH('2025/01/13') AS MONTH_END;