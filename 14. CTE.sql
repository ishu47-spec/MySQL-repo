SELECT AVG(`AVG(salary)`) AS TOTAL_AVG
FROM
(SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal                       # yo hamile subquery bata grda readability naramro vo and complex vo
	ON dem.employee_id = sal.employee_id
GROUP BY gender) NEW_TABLE;

WITH CTE_Example(CTE_GENDER, CTE_AVG, CTE_MAX, CTE_MIN, CTE_COUNT) AS   # in this way, we can even name the columns in CTE
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal                       # yo hamile CTE bata grda readability better vo 
	ON dem.employee_id = sal.employee_id         # CTE bata more advanced calculations ni grna sakinxa
GROUP BY gender
)
SELECT AVG(CTE_AVG)
FROM CTE_Example;



WITH CTE_example1 AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *                                 # NOTE: CTE is preferred over subquery and WINDOW funcns preferred over groupby
FROM CTE_example1 c1
JOIN CTE_example2 c2
	ON c1.employee_id = c2.employee_id
;




