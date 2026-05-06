-- UNION - combines the results of two or more SELECT statements into one result set, stacking them vertically.

SELECT first_name, last_name
FROM employee_demographics
UNION ALL               # ALL is used because the UNION by default uses DISTINCT
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old Man' as Label
FROM employee_demographics
WHERE age>40 and gender = 'male'
UNION 
SELECT first_name, last_name, 'Old Lady' as Label
FROM employee_demographics
WHERE age>40 and gender = 'female'
UNION
SELECT first_name, last_name, 'Highly paid employee' as Label
FROM employee_salary 
WHERE salary > 70000
ORDER BY first_name, last_name
;