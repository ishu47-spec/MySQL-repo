SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT gender, AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON 	dem.employee_id = sal.employee_id
GROUP BY gender;
