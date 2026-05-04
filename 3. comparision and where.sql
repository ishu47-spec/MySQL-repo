-- WHERE Clause and Comparision operators

SELECT * FROM employee_salary WHERE first_name = 'Leslie';
SELECT * FROM employee_salary;

SELECT * FROM employee_salary WHERE salary <= 50000;

SELECT * FROM employee_demographics WHERE gender !='Male';

SELECT * FROM employee_demographics WHERE birth_date > '1985-01-01';