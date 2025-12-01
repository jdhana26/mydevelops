create database construction;
use construction;
CREATE TABLE materials (
    material_id INT,
    material_name VARCHAR(50),
    quantity VARCHAR(30),
    unit VARCHAR(20),
    amount INT
);
INSERT INTO materials (material_name, quantity, unit, amount) VALUES
("Bricks", "2", "loads", 10000),
("Cement", "50", "bags", 20000),
("Sand", "3", "tons", 15000),
("Steel Rods", "100", "pieces", 50000),
("Gravel", "5", "tons", 12000);


 
create table staff(
staff_id int ,
staff_name varchar(20) primary key,
position_name varchar(40),
age int

);
drop table staff;
INSERT INTO staff (staff_id, staff_name, position_name, age) VALUES
(01, "Suresh", "Engineer", 32),
(02, "Rajesh", "Junior Engineer", 28),
(03, "Kumar", "Supervisor", 40),
(04, "Srimathi", "Accountant", 30),
(05, "Arun", "Manager", 35),
(06, "Divya", "Safety Officer", 29),
(07, "Vinoth", "Electrician", 33);

create table attendance(
staff_name varchar(20),
attendance varchar(3),
  index(staff_name),
  foreign key attendance (staff_name) references staff(staff_name)




);
insert into attendance (staff_name,attendance) values("Suresh", "p"),
( "Rajesh", "A"),
( "Kumar", "P"),
( "Srimathi", "A"),
( "Arun", "P"),
( "Divya", "P" ),
("Vinoth", "P");
 CREATE TABLE stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(50),
    quantity VARCHAR(30),
    unit VARCHAR(20),
    amount INT
);
INSERT INTO stock (item_name, quantity, unit, amount) VALUES
("Bricks", "5000", "pieces", 8000),
("Cement", "40", "bags", 16000),
("Sand", "3", "tons", 12000),
("Steel Rods", "80", "pieces", 45000),
("Gravel", "4", "tons", 10000);

CREATE TABLE salary (
    staff_name VARCHAR(20),
    salary_amount INT,
    FOREIGN KEY (staff_name) REFERENCES staff(staff_name)
);
INSERT INTO salary (staff_name, salary_amount) VALUES
("Suresh", 45000),
("Rajesh", 30000),
("Kumar", 50000),
("Srimathi", 32000),
("Arun", 60000),
("Divya", 35000),
("Vinoth", 28000);

