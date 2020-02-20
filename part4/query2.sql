-- What is the name of the youngest employee?

SELECT first_name FROM employees
ORDER BY birth_date DESC
LIMIT 1;
