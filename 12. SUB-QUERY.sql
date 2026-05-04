SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics
WHERE employee_id IN (
					SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1 )
                    ;

SELECT first_name, salary
FROM employee_salary
WHERE salary > (SELECT AVG(salary) FROM employee_salary);              # USING subquery with WHERE

SELECT first_name,
last_name,                 # USING subquery with SELECT
salary,
(SELECT AVG(salary)
FROM employee_salary) AS average
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(`MAX(age)`)
FROM                               # using subquery with FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics                                   # works same as code written just above but we were able to calculate avg of max(age)
GROUP BY gender) as AGG_table;                # FROM ma subquery use garexi tyo table lai AS vanera nam dinai prxa

