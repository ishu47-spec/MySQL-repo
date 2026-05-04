SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 5;                # PRINTS top 5 oldest people's data

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 5,2;

-- ALIASING 

SELECT gender, AVG(age) AS avg_age        # AS replaces the name, but is works the same without writing AS as well
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

SELECT gender, AVG(age)  avg_age          # without AS
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

SELECT *, occupation AS pesha 
FROM employee_salary;