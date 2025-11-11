create database employee;
use employee;
CREATE TABLE EmployeeDetail (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(15,2),
    JoiningDate DATETIME,
    Department VARCHAR(50),
    Gender VARCHAR(10)
);
INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
VALUES
(1, 'Riya', 'Verma', 650000.00, '2015-03-12 10:45:15.250', 'IT', 'Female'),
(2, 'Arjun', 'Singh', 520000.00, '2016-07-21 14:10:43.180', 'HR', 'Male'),
(3, 'Priya', 'Sharma', 950000.00, '2017-09-10 08:55:37.600', 'IT', 'Female'),
(4, 'Karan', 'Mehta', 470000.00, '2018-11-03 16:22:59.923', 'Finance', 'Male'),
(5, 'Sneha', 'Patil', 510000.00, '2019-04-17 12:05:44.783', 'Payroll', 'Female');

SELECT * FROM EmployeeDetail;

SELECT FirstName FROM EmployeeDetail;

SELECT UPPER(FirstName) AS FirstName FROM EmployeeDetail;

SELECT LOWER(FirstName) AS FirstName FROM EmployeeDetail;

SELECT CONCAT(FirstName, ' ', LastName) AS Name FROM EmployeeDetail;

SELECT * FROM EmployeeDetail WHERE FirstName = 'Vikas';

-- 7. Employees whose FirstName starts with 'a'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'a%';

-- 8. Employees whose FirstName contains 'k'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%k%';

-- 9. Employees whose FirstName ends with 'h'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%h';

-- 10. FirstName starts with any character between 'a-p'
SELECT * FROM EmployeeDetail WHERE FirstName REGEXP '^[a-p]';

-- 11. FirstName not starting between 'a-p'
SELECT * FROM EmployeeDetail WHERE FirstName REGEXP '^[^a-p]';

-- 12. Gender ends with 'le' and has 4 letters
SELECT * FROM EmployeeDetail WHERE Gender LIKE '_le';

-- 13. FirstName starts with 'A' and is 5 letters
SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'A__';

-- 14. FirstName containing '%' (e.g., "Vik%as")
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%\%%';

-- 15. Unique Departments
SELECT DISTINCT Department FROM EmployeeDetail;

-- 16. Highest Salary
SELECT MAX(Salary) FROM EmployeeDetail;

-- 17. Lowest Salary
SELECT MIN(Salary) FROM EmployeeDetail;

SELECT DATE_FORMAT(JoiningDate, '%Y/%m/%d') FROM EmployeeDetail;

-- 20. Show only time part of JoiningDate
SELECT DATE_FORMAT(JoiningDate, '%H:%i:%s') FROM EmployeeDetail;

-- 21. Get year part of JoiningDate
SELECT YEAR(JoiningDate) FROM EmployeeDetail;

-- 22. Get month part of JoiningDate
SELECT MONTH(JoiningDate) FROM EmployeeDetail;

-- 23. Get system date
SELECT NOW();

-- 24. Get UTC date
SELECT UTC_TIMESTAMP();

-- 25. First name, current date, joining date, diff in months
SELECT FirstName, NOW() AS CurrentDate, JoiningDate,
PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM NOW()), EXTRACT(YEAR_MONTH FROM JoiningDate)) AS TotalMonths
FROM EmployeeDetail;

-- 26. First name, current date, joining date, diff in days
SELECT FirstName, NOW() AS CurrentDate, JoiningDate,
DATEDIFF(NOW(), JoiningDate) AS TotalDays
FROM EmployeeDetail;

-- 27. Employees whose joining year is 2013
SELECT * FROM EmployeeDetail WHERE YEAR(JoiningDate) = 2013;

-- 28. Employees whose joining month is January
SELECT * FROM EmployeeDetail WHERE MONTH(JoiningDate) = 1;

-- 29. Employees joining between "2013-01-01" and "2013-12-01"
SELECT * FROM EmployeeDetail WHERE JoiningDate BETWEEN '2013-01-01' AND '2013-12-01';

-- 30. Number of employees
SELECT COUNT(*) FROM EmployeeDetail;

-- 31. Select the top 1 record
SELECT * FROM EmployeeDetail LIMIT 1;

-- 32. Employees with names "Vikas","Ashish","Nikhil"
SELECT * FROM EmployeeDetail WHERE FirstName IN ('Vikas','Ashish','Nikhil');

-- 33. Employees not in "Vikas","Ashish","Nikhil"
SELECT * FROM EmployeeDetail WHERE FirstName NOT IN ('Vikas','Ashish','Nikhil');

-- 34. Remove white space from right side of FirstName
SELECT RTRIM(FirstName) AS FirstName FROM EmployeeDetail;

-- 35. Remove white space from left side of FirstName
SELECT LTRIM(FirstName) AS FirstName FROM EmployeeDetail;

-- 36. Display FirstName and Gender as M/F
SELECT FirstName, 
       CASE WHEN Gender = 'Male' THEN 'M'
            WHEN Gender = 'Female' THEN 'F'
       END AS Gender
FROM EmployeeDetail;

-- 37. FirstName prefixed with "Hello "
SELECT CONCAT('Hello ', FirstName) FROM EmployeeDetail;

-- 38. Employees with Salary greater than 600000
SELECT * FROM EmployeeDetail WHERE Salary > 600000;

-- 39. Employees with Salary less than 700000
SELECT * FROM EmployeeDetail WHERE Salary < 700000;

-- 40. Employees with Salary between 500000 and 600000
SELECT * FROM EmployeeDetail WHERE Salary BETWEEN 500000 AND 600000;
