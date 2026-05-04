# STORED PROCEDURE

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary>=50000;

CALL large_salaries();


DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >=50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3();
CALL large_salaries3();


DELIMITER $$
DROP PROCEDURE IF EXISTS large_salaries5;            # Finally found the correct way
CREATE PROCEDURE large_salaries5(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

CALL large_salaries5(3);
    
