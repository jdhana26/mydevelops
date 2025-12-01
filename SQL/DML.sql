create database meiyazhagan;
use meiyazhagan;

create table casting  (
  user_id varchar(5) primary key,
  cast_name varchar(20),
  role_name varchar(20),
  age int,
  call_sheet varchar(20)
);

insert into casting (user_id,cast_name,role_name,age,call_sheet)
values
("c1","Aravindsamy","Arulmozhi",55,"60"),
("c2","karthi","Meiyazahagan",48,"60"),
("c3","Sridiviya","Nandhini",32,"40"),
("c4","Rajakiran","Sudalamuthu",76,"20"),
("c5","Jayaprakash","Arivudai nambi",63,"35");
 select * from casting;
 create table dop(
 id int  ,
 eq_name varchar(20),
 unit int
 );
 insert into dop (id,eq_name,unit)values(1,"Camera",4),(2,"lens",15),(3,"lights",10),(4,"drone",2);
 

 create table salary(
  user_id varchar(5),
  salary_amount varchar(30),
  index(user_id),
  foreign key salary (user_id) references casting(user_id)
);

insert into salary(user_id, salary_amount)
values
("c1","1L"),
("c2","1L"),
("c3","1L");
 create table attendance(
   
   cast_name varchar(30),
   attendie varchar(30)
);
insert into attendance (cast_name,attendie)values("arulmozhi","present"),("karthi","present");
use meiyazhagan;
create table techinicians(
t_name varchar(30),
field_name varchar(30)
);
INSERT INTO techinicians (t_name,field_name) VALUES
("Tharun", "Editor"),
("Karthik", "Camera"),
("Varun", "Sound"),
("Anbu", "Lighting"),
("siva", "Makeup"),
("Ravi", "AD"),
("Meena", "Costume"),
("Arun", "Writer"),
("Sita", "Designer");


 