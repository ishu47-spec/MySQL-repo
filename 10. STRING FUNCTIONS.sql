# 1. LENGTH
SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;      # orders the length(first_name) column in ascending order

# 2. UPPER AND LOWER
SELECT UPPER('skyfall');
SELECT LOWER('skyfall');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

# 3. TRIM                            # Trims the empty spaces in both sides of a string
SELECT TRIM('          sky            ');
SELECT LTRIM('          SKY          ');     # trims only the left side of empty spaces
SELECT RTRIM('         SKY          ')  ;    # trims only the right side of empty spaces

# 4. SUBSTRING
SELECT first_name, LEFT (first_name, 3), RIGHT(first_name, 3)    
FROM employee_demographics;

SELECT first_name, 
SUBSTRING(first_name,3,2),      # 3 indicate starting position and 2 indicates no. of characters from starting position
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

# 5. REPLACE
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

# 6. LOCATE
SELECT LOCATE('x', 'Alexander') position_of_x;

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

# 7. CONCAT
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) full_name
FROM employee_demographics;