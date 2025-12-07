
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
 

 
create table emp_log(
    log_id int auto_increment primary key,
    action_type varchar(20),
    emp_id int,
    old_salary varchar(30),
    new_salary varchar(30),
    log_time timestamp
);
 
 

create table emp_archive(
    archive_id int auto_increment primary key,
    user_id varchar(5),
    emp_name varchar(30),
    emp_age varchar(30),
    emp_dept varchar(30),
    emp_salary varchar(30),
    deleted_time timestamp
);
 

 
create table emp_count(
    id int primary key,
    total_employees int
);

insert into emp_count values (1,0);
 

 DELIMITER &&

create trigger log_new_employee
after insert on employee
for each row
insert into emp_log(action_type, emp_id, new_salary, log_time)
values ('insert', new.id, new.emp_salary, now());
DELIMITER ;

 DELIMITER &&
create trigger auto_timestamp_before_insert
before insert on employee
for each row
set new.created_time = now();
DELIMITER ;

 
create trigger log_salary_change
after update on employee
for each row
insert into emp_log(action_type, emp_id, old_salary, new_salary, log_time)
values ('salary_update', new.id, old.emp_salary, new.emp_salary, now());
 
 
create trigger prevent_salary_decrease
before update on employee
for each row
begin
    if new.emp_salary < old.emp_salary then
        signal sqlstate '45000'
        set message_text = 'salary decrease not allowed';
    end if;
end;
 

 
 
create trigger validate_positive_salary
before insert on employee
for each row
begin
    if new.emp_salary <= 0 then
        signal sqlstate '45000'
        set message_text = 'salary must be positive';
    end if;
end;
 

 
create trigger archive_deleted_employee
after delete on employee
for each row
insert into emp_archive(user_id, emp_name, emp_age, emp_dept, emp_salary, deleted_time)
values (old.user_id, old.emp_name, old.emp_age, old.emp_dept, old.emp_salary, now());
 

 
create trigger increase_employee_count
after insert on employee
for each row
update emp_count set total_employees = total_employees + 1 where id = 1;
 

 
create trigger decrease_employee_count
after delete on employee
for each row
update emp_count set total_employees = total_employees - 1 where id = 1;
 
create trigger uppercase_name_before_insert
before insert on employee
for each row
set new.emp_name = upper(new.emp_name);
 

Add column if needed:

 
alter table employee add modified_time timestamp;
 

 
create trigger set_modified_timestamp
before update on employee
for each row
set new.modified_time = now();
 

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_before_insert_timestamp
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_after_update_salary_log
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO emp_log(action_type, emp_name, old_salary, new_salary, action_time)
        VALUES ('UPDATE_SALARY', NEW.name, OLD.salary, NEW.salary, NOW());
    END IF;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_before_update_no_decrease
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary decrease not allowed!';
    END IF;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_before_insert_validate_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be positive';
    END IF;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_after_delete_archive
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_archive(emp_name, emp_salary, deleted_at)
    VALUES (OLD.name, OLD.salary, NOW());
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_after_insert_count
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    UPDATE company_stats SET total_employees = total_employees + 1;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_after_delete_count
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    UPDATE company_stats SET total_employees = total_employees - 1;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_before_insert_uppercase
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_before_update_modified_time
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END $$

DELIMITER ;