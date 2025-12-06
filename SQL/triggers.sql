

DELIMITER $$

CREATE TRIGGER trg_after_insert_log
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_log(action_type, emp_name, emp_salary, action_time)
    VALUES ('INSERT', NEW.name, NEW.salary, NOW());
END $$

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