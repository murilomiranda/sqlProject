-- What is the employee id of the highest-paid employee?

SELECT emp_id FROM salaries
ORDER BY salary DESC
LIMIT 1;