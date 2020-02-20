-- What is the employee id of the highest-paid employee?

SELECT emp_id FROM salaries
ORDER BY salary DESC
LIMIT 1;


-- What is the name of the youngest employee?

SELECT first_name FROM employees
ORDER BY birth_date DESC
LIMIT 1;

-- What is the name of the first hired employee?

SELECT first_name FROM employees
ORDER BY hire_date
LIMIT 1;

-- What percentage of employees are Female?

SELECT gender, COUNT(*)/(SELECT COUNT(*) FROM employees) AS perc FROM employees
WHERE gender = 'F';

-- Show the employee count by department name wise, sorted alphabetically on department name.

SELECT dept_name, COUNT(*) As Num
FROM departments a
INNER JOIN dept_emp b
ON a.dept_no = b.dept_no
GROUP BY dept_name
ORDER BY dept_name;

-- Count the number of employees by each calendar year (take the value of year from from_date)

SELECT YEAR(from_date) AS calendar_year, COUNT(*) AS employee_count FROM dept_emp
GROUP BY calendar_year
ORDER BY calendar_year DESC;

/* Count the number of employees by each calendar year (take the value of year from from_date) 
   ordered by the calendar year excluding all years before 1990. Divide the employee count based on gender.*/

SELECT YEAR(from_date) AS calendar_year, gender, COUNT(*) AS employee_count
FROM dept_emp a
INNER JOIN employees b
ON a.emp_id = b.emp_id
GROUP BY calendar_year, gender
HAVING calendar_year >= 1990
ORDER BY calendar_year, gender;

-- What is the number of managers hired each calendar year?

SELECT YEAR(hire_date) AS calendar_year, COUNT(*) AS managers FROM dept_manager a
INNER JOIN employees b
ON a.emp_id = b.emp_id
GROUP BY calendar_year
ORDER BY calendar_year;

-- What will be the department-wise break up of managers?

SELECT YEAR(hire_date) AS calendar_year, dept_name AS department_name, COUNT(*) AS employee
FROM departments a
INNER JOIN dept_manager b
ON a.dept_no = b.dept_no
INNER JOIN employees c
ON b.emp_id = c.emp_id 
GROUP BY calendar_year, department_name
ORDER BY calendar_year, department_name;

-- What is the number of male managers and female managers hired each calendar year from the year 1990 onwards?

SELECT YEAR(hire_date) AS calendar_year, gender, COUNT(*) AS managers 
FROM employees a
INNER JOIN dept_manager b
ON a.emp_id = b.emp_id
GROUP BY calendar_year, gender
HAVING calendar_year >= 1990
ORDER BY calendar_year;