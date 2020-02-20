-- What is the number of male managers and female managers hired each calendar year from the year 1990 onwards?

SELECT YEAR(hire_date) AS calendar_year, gender, COUNT(*) AS managers 
FROM employees a
INNER JOIN dept_manager b
ON a.emp_id = b.emp_id
GROUP BY calendar_year, gender
HAVING calendar_year >= 1990
ORDER BY calendar_year;