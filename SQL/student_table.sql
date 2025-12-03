create database studenttable ;
use studenttable;
create table students (
    student_id int primary key auto_increment,
    student_name varchar(100) not null
);

create table courses (
    course_id int primary key auto_increment,
    course_name varchar(100) not null,
    teacher varchar(100) not null
);
INSERT INTO students (student_name) VALUES
('Arun Kumar'),
('Priya'),
('Suresh'),
('Meena'),
('Vijay');

INSERT INTO courses (course_name, teacher) VALUES
('Mathematics', 'Mr. Ramesh'),
('Science', 'Ms. Kavitha'),
('English', 'Mr. Daniel'),
('Computer Science', 'Ms. Aarthi'),
('History', 'Mr. Balaji');


