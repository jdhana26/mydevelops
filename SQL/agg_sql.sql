 CREATE database emp_details;
USE emp_details;

CREATE TABLE Employee1(
id INT PRIMARY KEY NOT NULL, 
user_id VARCHAR(40) UNIQUE , 
emp_Name VARCHAR(50),
emp_Age INT,
emp_Dept VARCHAR(100),
emp_Mobile VARCHAR(10),
emp_City VARCHAR(40), 
emp_Salary VARCHAR(10), 
join_Date DATE 




);
 INSERT INTO Employee1
(id, user_id, emp_Name, emp_Age, emp_Dept, emp_Mobile, emp_City, emp_Salary, join_Date)
VALUES
(1, 'EMP101', 'Rahul', 28, 'IT', '9876543210', 'Bangalore', '30000', '2025-12-02'),
(2, 'EMP102', 'Sneha', 25, 'HR', '9876543211', 'Hyderabad', '28000', '2025-12-02'),
(3, 'EMP103', 'Naveen', 30, 'IT', '9876543212', 'Pune', '35000', '2025-12-02'),
(4, 'EMP104', 'Kavya', 27, 'Finance', '9876543213', 'Kochi', '32000', '2025-12-02'),
(5, 'EMP105', 'Mahesh', 32, 'Operations', '9876543214', 'Mysore', '40000', '2025-12-02'),
(6, 'EMP106', 'Anitha', 26, 'Design', '9876543215', 'Visakhapatnam', '29000', '2025-12-02'),
(7, 'EMP107', 'Rohit', 29, 'Marketing', '9876543216', 'Vadodara', '36000', '2025-12-02');

SELECT emp_Dept,SUM(emp_Salary) AS TOTAL_SALARY FROM Employee1 GROUP BY emp_Dept;
SELECT emp_name,emp_Salary, round(emp_Salary) FROM Employee1;
SELECT emp_name FROM Employee1 WHERE length(emp_name)>5;
SET SQL_SAFE_UPDATES = 0;
UPDATE Employee1 SET emp_Name=upper(emp_Name);
SELECT * FROM Employee1;

ALTER TABLE Employee1 ADD Bonus INT;
SELECT * FROM Employee1;

UPDATE Employee1
SET emp_Salary = CAST(emp_Salary AS UNSIGNED) * 1.10
WHERE user_id = 'U003';