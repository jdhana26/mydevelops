create  database employeedetails;
use employeedetails;
create table employee(
emp_id int primary key auto_increment,
emp_name varchar(30),
emp_dept varchar(20),
emp_salary varchar(10),
emp_city varchar(20)


);
INSERT INTO employee (emp_name, emp_dept, emp_salary, emp_city) VALUES
("Suresh", "HR", "25000", "Chennai"),
("Priya", "IT", "30000", "Coimbatore"),
("Arun", "UI/UX", "45000", "Madurai"),
("Karthik", "UI/UX", "32000", "Trichy"),
("Divya", "Design", "28000", "Salem"),
("Ravi", "TL", "26000", "Erode"),
("Meena", "Developer", "35000", "Chennai");

select emp_dept, count(*) as tot_emp_dept from employee group by emp_dept;
select emp_dept,avg(emp_salary) as avg_salary from employee group by emp_dept;
 select emp_city ,count(*) as tot_city from employee group by emp_city;
select emp_dept, min(emp_salary) as min_salary,max(emp_salary) as max_salary from employee group by emp_dept;
select emp_dept, count(*) as totemp from employee group by emp_dept having count(*)>1;
select emp_dept , count(*) as avg_salary from employee group by emp_dept having avg(emp_salary)>30000;
select emp_city ,count(*) as avg_salary from employee group by emp_city;




