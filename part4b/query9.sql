-- What will be the department-wise break up of managers?

SELECT YEAR(hire_date) AS calendar_year, dept_name AS department_name, COUNT(*) AS employee
FROM departments a
INNER JOIN dept_manager b
ON a.dept_no = b.dept_no
INNER JOIN employees c
ON b.emp_id = c.emp_id 
GROUP BY calendar_year, department_name
ORDER BY calendar_year, department_name;