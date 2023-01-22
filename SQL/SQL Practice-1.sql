--write a SQL query to find the Location of the employees.

select emp.empfname,dp.location from department as dp 
Inner JOIN employee as emp 
ON dp.deptcode = emp.deptcode


--write a SQL query to find the jobs of the perticular department of the employees.

select DISTINCT emp.job,dp.deptname from department as dp 
Inner JOIN employee as emp 
ON dp.deptcode = emp.deptcode


---display the list of the employee who got the commission

select empcode, empfname,job, commission from employee
where commission != 0


--Display the employee list of the joined after 1990

select concat( empfname,' ',emplname) as full_name,
date_part('year',hiredate) as joining_year from employee 
where hiredate > date '1990-01-01'


--Select the department name of all employees who were hired before '1982-01-01'

SELECT DeptName FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
WHERE HireDate < '1982-01-01'


--Select the name and salary of all managers who have a salary greater than 3000

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, Salary FROM EMPLOYEE 
WHERE Job = 'MANAGER' AND Salary > 3000


--Select the department code, department name, and the average salary of all employees in that department

SELECT DEPARTMENT.DeptCode, DeptName, AVG(Salary) FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
GROUP BY DEPARTMENT.DeptCode, DeptName


--Select the name and hire date of all employees whose hire date is in the month of December

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, HireDate FROM EMPLOYEE 
WHERE EXTRACT(MONTH FROM HireDate) = 12


--Select the department name and the total salary of all employees in that department

SELECT DeptName, SUM(Salary) FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
GROUP BY DeptName


--Select the department name, department location, and the number of employees in that department

SELECT DeptName, LOCATION, COUNT(EmpCode) FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
GROUP BY DeptName, LOCATION


-- Select the name of all employees who are not assigned to any department

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name FROM EMPLOYEE 
WHERE DEPTCODE IS NULL


--Select the name, salary, and commission of all employees who have a salary greater than or equal to 3000 and commission less than or equal to 100

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, Salary, Commission FROM EMPLOYEE 
WHERE Salary >= 3000 and Commission <= 100

