--Select the name and salary of all employees who are not managers and have a salary greater than 2000.

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, Salary FROM EMPLOYEE 
WHERE Job != 'MANAGER' AND Salary > 2000


--Select the department name and the total salary of all employees in that department, ordered by the total salary in descending order.

SELECT DeptName, SUM(Salary) as Total_Salary FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
GROUP BY DeptName
ORDER BY Total_Salary DESC


--Select the name of all employees who are not assigned to any department and have a commission greater than 0.

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name FROM EMPLOYEE 
WHERE DEPTCODE IS NULL AND Commission > 0


--Select the name, job, and manager of all employees who have a commission greater than 0 and are not assigned to any department.

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, Job, Manager FROM EMPLOYEE 
WHERE DEPTCODE IS NULL AND Commission > 0


--Select the name and salary of all employees who are in the department with department code 20 and have a salary greater than or equal to 3000

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, Salary FROM EMPLOYEE 
WHERE DEPTCODE = 20 AND Salary >= 3000


--Select the name, job, and manager of all employees who have a hire date in the year 1981 and are not assigned to any department.

SELECT CONCAT(EmpFName, ' ', EmpLName) as Name, Job, Manager FROM EMPLOYEE 
WHERE DEPTCODE IS NULL AND EXTRACT(YEAR FROM HireDate) = 1981


--Select the department name and the average salary of all employees in that department, ordered by the average salary in ascending order.

SELECT DeptName, Round(AVG(Salary),2) as Average_Salary FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
GROUP BY DeptName
ORDER BY Average_Salary ASC


--Select the department name and the total salary of all employees in that department, where the department has more than 2 employees and ordered by the total salary in ascending order.

SELECT DeptName, SUM(Salary) as Total_Salary FROM DEPARTMENT 
JOIN EMPLOYEE ON DEPARTMENT.DeptCode = EMPLOYEE.DeptCode
GROUP BY DeptName
HAVING COUNT(EmpCode) > 2 


-- Find N th highest salary

WITH ordered_salaries AS (
  SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) as row_num
  FROM EMPLOYEE
)
SELECT Salary
FROM ordered_salaries
WHERE row_num = 1


--Find minimum salary 

WITH ordered_salaries AS (
  SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) as row_num
  FROM EMPLOYEE
)
SELECT Salary
FROM ordered_salaries
WHERE row_num = 1



