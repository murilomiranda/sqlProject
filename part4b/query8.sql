-- What is the number of managers hired each calendar year?

SELECT YEAR(hire_date) AS calendar_year, COUNT(*) AS managers FROM dept_manager a
INNER JOIN employees b
ON a.emp_id = b.emp_id
GROUP BY calendar_year
ORDER BY calendar_year;