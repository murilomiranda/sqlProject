-- Count the number of employees by each calendar year ( take the value of year from from_date)

SELECT YEAR(from_date) AS calendar_year, COUNT(*) AS employee_count FROM dept_emp
GROUP BY calendar_year
ORDER BY calendar_year DESC;
