-- What percentage of employees are Female?

SELECT gender, COUNT(*)/(SELECT COUNT(*) FROM employees) AS perc FROM employees
WHERE gender = 'F';