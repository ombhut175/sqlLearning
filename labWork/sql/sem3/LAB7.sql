CREATE TABLE EMP(
	EID INT,
	ENAME VARCHAR(50),
	DEPARTMENT VARCHAR(25),
	SALARY INT,
	JOININGDATE DATE,
	CITY VARCHAR(25)
);

SELECT * FROM EMP;

INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (101,'RAHUL','Admin',56000,'1-Jan-90','Rajkot')
INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (102,'Hardik','IT',18000,'25-Sep-90','Ahmedabad');
INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (103,'Bhavin','HR',25000,'14-May-91','Baroda');
INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (104,'Bhoomi','Admin',39000 ,'8-Feb-91','Rajkot');
INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (105,'Rohit','IT',17000,'23-Jul-90','Jamnagar');
INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (106,'Priya','IT',9000,'18-Oct-90','Ahmedabad');
INSERT INTO EMP(EID,ENAME,DEPARTMENT,SALARY,JOININGDATE,CITY) VALUES (107,'Bhoomi','HR',34000,'25-Dec-91','Rajkot');




--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
	SELECT MAX(SALARY) AS MAXIMUM,MIN(SALARY) AS MINIMUM FROM EMP;
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively.
	SELECT SUM(SALARY) AS TOTAL_SAL,AVG(SALARY) AS AVERAGE_SAL FROM EMP;
--3. Find total number of employees of EMPLOYEE table.
	SELECT COUNT(EID) FROM EMP;
--4. Find highest salary from Rajkot city.
	SELECT MAX(SALARY) AS MAX_RAJKOT FROM EMP WHERE CITY='RAJKOT';
--5. Give maximum salary from IT department.
	SELECT MAX(SALARY) AS MAXIMUM FROM EMP WHERE DEPARTMENT='IT';
--6. Count employee whose joining date is after 8-feb-91.
	SELECT COUNT(EID) AS COUNT FROM EMP WHERE JOININGDATE>'8-FEB-91';
--7. Display average salary of Admin department.
	SELECT AVG(SALARY) AS AVG_SALARY FROM EMP WHERE DEPARTMENT='ADMIN';
	--SELECT AVG(SALARY) AS AVG_SALARY FROM EMP GROUP BY DEPARTMENT HAVING DEPARTMENT='ADMIN'; 
--8. Display total salary of HR department.
	SELECT SUM(SALARY) AS SUM_SALARY FROM EMP WHERE DEPARTMENT='HR';
--9. Count total number of cities of employee without duplication.
	SELECT COUNT(DISTINCT CITY) AS COUNT_CITY FROM EMP;
--10. Count unique departments.
	SELECT COUNT (DISTINCT DEPARTMENT) AS COUNT_DEPARTMENT FROM EMP;
--11. Give minimum salary of employee who belongs to Ahmedabad.
	SELECT MIN(SALARY) AS MINIMUM FROM EMP WHERE CITY = 'AHMEDABAD';
--12. Find city wise highest salary.
	SELECT MAX(SALARY) AS MAXIMUM FROM EMP GROUP BY CITY;
--13. Find department wise lowest salary.
	SELECT MIN(SALARY) AS MIN FROM EMP GROUP BY SALARY;
--14. Display city with the total number of employees belonging to each city.
	SELECT CITY,COUNT(EID) AS COUNT FROM EMP GROUP BY CITY;
--15. Give total salary of each department of EMP table.\
	SELECT DEPARTMENT , SUM(SALARY) FROM EMP GROUP BY DEPARTMENT;
--16. Give average salary of each department of EMP table without displaying the respective department
--name.
	SELECT AVG(SALARY) FROM EMP GROUP BY DEPARTMENT;

--	Part � B:
--1. Count the number of employees living in Rajkot.
	SELECT COUNT(EID) FROM EMP WHERE CITY='RAJKOT';
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
	SELECT MAX(SALARY) AS MAX,MIN(SALARY) AS MIN,MAX(SALARY)-MIN(SALARY) AS DIFFERENCE FROM EMP;
--3. Display the total number of employees hired before 1st January, 1991
	SELECT COUNT(EID) AS TOTAL_EMPLOYESS FROM EMP WHERE JOININGDATE<'1-JANUARY-1991';


--	Part � C:
--1. Count the number of employees living in Rajkot or Baroda.
	SELECT COUNT(EID) AS COUNT FROM EMP WHERE CITY='RAJKOT' OR CITY='BARODA';
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
	SELECT COUNT(EID) AS COUNT FROM EMP WHERE JOININGDATE<'1-JAN-1991' AND DEPARTMENT='IT';
--3. Find the Joining Date wise Total Salaries.
	SELECT JOININGDATE,SUM(SALARY) AS SUM FROM EMP GROUP BY JOININGDATE;
--4. Find the Maximum salary department & city wise in which city name starts with �R�.
	SELECT DEPARTMENT, CITY ,MAX(SALARY) AS MAX FROM EMP WHERE CITY LIKE 'R%' GROUP BY DEPARTMENT,CITY;

	SELECT * FROM EMP;