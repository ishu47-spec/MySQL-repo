
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager'
GROUP BY occupation
HAVING AVG(salary) > 75000;     # HAVING is only applied when aggregate function after GROUP BY runs

SELECT gender, AVG(age)
FROM employee_demographics
WHERE age>40
GROUP BY gender;      # Order of execution was, FROM -> WHERE -> GROUP BY -> SELECT

# HAVING can be done without forming groups(using GROUPBY), but the aggregate funcn like AVG will work for entire column without forming groups
