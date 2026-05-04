SELECT * 
FROM parks_and_recreation.employee_demographics;    # prints every column of mentioned database

SELECT * 
FROM employee_demographics;        # no need to mention database's name if you have hovered over it

SELECT first_name, last_name, birth_date, age, (age+10)*10
FROM parks_and_recreation.employee_demographics;

#PEMDAS  

SELECT DISTINCT gender 
FROM parks_and_recreation.employee_demographics; 