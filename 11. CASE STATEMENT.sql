SELECT 
first_name,
last_name,
age,
CASE
	WHEN age<30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Adult'
    WHEN age>50 THEN 'Old'
END AS age_category
FROM employee_demographics;