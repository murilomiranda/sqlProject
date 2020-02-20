/* Count the number of employees by each calendar year (take the value of year from from_date) 
   ordered by the calendar year excluding all years before 1990. Divide the employee count based on gender.*/

SELECT YEAR(from_date) AS calendar_year, gender, COUNT(*) AS employee_count
FROM dept_emp a
INNER JOIN employees b
ON a.emp_id = b.emp_id
GROUP BY calendar_year, gender
HAVING calendar_year >= 1990
ORDER BY calendar_year, gender;