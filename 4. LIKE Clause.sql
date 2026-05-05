-- LIKE STATEMENT
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%a%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';