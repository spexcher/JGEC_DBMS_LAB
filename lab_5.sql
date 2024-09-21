create database lab5;
use lab5;
CREATE TABLE EMPLOYEE (
        Emp_no INT PRIMARY KEY,
        E_name VARCHAR(50),
        E_address VARCHAR(100),
        E_ph_no VARCHAR(15),
        Dept_no INT,
        Dept_name VARCHAR(50),
        Job_id VARCHAR(20),
        Salary DECIMAL(10, 2),
        Manager_id INT
    );
    INSERT INTO EMPLOYEE (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary, Manager_id) VALUES
     (1, 'Alice', '123 St', '1234567890', 101, 'Sales', 'Sales Manager', 30000, 3),
     (2, 'Bob', '456 St', '1234567891', 102, 'HR', 'HR Manager', 25000, 3),
     (3, 'Charlie', '789 St', '1234567892', 101, 'Sales', 'Sales Executive', 20000, NULL),
     (4, 'David', '1010 St', '1234567893', 101, 'Sales', 'Sales Executive', 22000, 1),
     (5, 'Eve', '1212 St', '1234567894', 103, 'IT', 'Developer', 28000, 6),
     (6, 'Frank', '1414 St', '1234567895', 103, 'IT', 'Developer', 27000, NULL),
     (7, 'Grace', '1616 St', '1234567896', 102, 'HR', 'Recruiter', 18000, 2),
     (8, 'Henry', '1818 St', '1234567897', 104, 'Marketing', 'Marketing Manager', 35000, 3),
     (9, 'Ivy', '2020 St', '1234567898', 104, 'Marketing', 'Marketing Executive', 22000, 8);

--1
    SELECT Job_id, SUM(Salary) AS Total_Salary
     FROM EMPLOYEE
     GROUP BY Job_id;
--2
    SELECT Manager_id, E_name, Salary
     FROM EMPLOYEE AS e1
     WHERE Salary = (
         SELECT MIN(Salary)
         FROM EMPLOYEE AS e2
         WHERE e2.Manager_id = e1.Manager_id
     )
     AND Manager_id IS NOT NULL;
--3
    SELECT Dept_name, COUNT(Emp_no) AS Number_of_Employees
     FROM EMPLOYEE
     GROUP BY Dept_name;
--4
    SELECT *
     FROM EMPLOYEE
     ORDER BY Salary ASC;
--5
    SELECT *
     FROM EMPLOYEE
     WHERE Salary > 16000
     ORDER BY Dept_name, Salary;
