create database emp_info;
use emp_info;
create table employee(
id int PRIMARY KEY auto_increment,
user_id varchar(5),
emp_name varchar(30),
emp_age varchar(30),
emp_dept varchar(30),
emp_salary varchar(30)
);
INSERT INTO employee (user_id, emp_name, emp_age, emp_dept, emp_salary)
VALUES
('E01', 'Tharun', '25', 'IT', '32000'),
('E02', 'Kavin', '27', 'HR', '28000'),
('E03', 'Suresh', '30', 'Finance', '45000'),
('E04', 'Meena', '24', 'Design', '30000'),
('E05', 'Karthik', '29', 'IT', '50000'),
('E06', 'Divya', '26', 'Marketing', '27000'),
('E07', 'Vignesh', '31', 'Watchmen', '40000'),
('E08', 'Lakshmi', '28', 'HR', '35000'),
('E09', 'Mani', '32', 'IT', '52000'),
('E10', 'Nisha', '23', 'Admin', '25000'),
('E11', 'Rahul', '27', 'TL', '26000'),
('E12', 'Jaya', '29', 'Finance', '47000');
 -- 1
 select  emp_dept, count(*) from employee group by emp_dept having count(*) > 2;
 -- 2
 select emp_dept from employee group by emp_dept having avg(emp_salary)>40000;
 -- 3
 select emp_dept from employee group by emp_dept having max(emp_salary)>50000;
 -- 4
 
 select emp_dept ,sum(emp_salary) from employee group by emp_dept having sum(emp_salary)>100000;
 
-- 5.
Select * from employee;
-- 6
select emp_name from employee;
-- 7
select avg(emp_salary) as avg_salary from employee;

-- 8
select * from employee where emp_salary>50000;
-- 9
select * from employee where emp_dept='IT';
-- 10
select * from employee where emp_dept='HR' and emp_age>26 and emp_salary>28000;
-- 11
select * from employee where emp_name Like '%av%';
-- 12
select * from employee order by emp_salary asc;
-- 13
select * from employee order by emp_salary desc;
-- 14
select * from employee limit 8;
-- 15
SELECT DISTINCT emp_dept
FROM employee;
-- 16
select count(distinct emp_dept) as tot_dept from  employee;
-- 17
select count(emp_dept) as tot_dept from employee group by emp_dept;
-- 18
select avg(emp_salary) as tot_dept from employee group by emp_dept;
-- 19
select sum(emp_salary) as tot_dept from employee group by emp_dept;
-- 20
select max(emp_salary) as tot_dept from employee group by emp_dept;
-- 21
select emp_name,emp_age,count(*) from employee group by emp_name ,emp_age;
-- 22
select emp_dept ,count(*) from employee group by emp_dept having count(*)>2;
-- 23
select emp_dept,sum(emp_salary) from employee group by emp_dept having sum(emp_salary)>50000;
-- 24
select emp_dept,avg(emp_salary) from employee group by emp_dept having avg(emp_salary)>45000;
-- 25
select emp_dept, count(*) as tot_employee,sum(emp_salary) from employee group by emp_dept having count(*)>2 and sum(emp_salary)>50000;
 -- 26
 select distinct count(emp_age),emp_dept,count(*) from employee where emp_age>25 group by emp_dept having count(*)>1 and sum(emp_age)>18 order by emp_dept DESC;
  -- 27
  select emp_age from employee group by emp_age order by emp_age desc;
  --  28
  SELECT emp_dept,count(*) ,sum(emp_salary)  FROM employee WHERE emp_age > 25 GROUP BY emp_dept HAVING COUNT(*) > 1;
  -- 29
  select distinct emp_dept ,emp_age from employee where emp_age>28;
  -- 30
  select emp_dept ,count(*) as tot_empl,sum(emp_salary) as tot_salary,min(emp_salary) as min_sal,max(emp_salary) as max_sal,avg(emp_salary) as avg_sal from employee group by emp_dept;
  -- 31
  select * from employee where (emp_age > 25 and emp_dept = 'IT') or (emp_age < 30 and emp_dept = 'HR');
  -- 32
  select distinct emp_dept as department,count(*) as total_employees,sum(emp_salary) as total_salary,avg(emp_salary) as average_salary,max(emp_salary) as max_salary,min(emp_salary) as min_salary
from employee where emp_age > 25
group by emp_dept having count(*) > 1 and sum(emp_salary) > 10000 
order by total_salary desc
limit 5;













