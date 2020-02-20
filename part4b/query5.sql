-- Show the employee count by department name wise, sorted alphabetically on department name.

SELECT dept_name, COUNT(*) As Num
FROM departments a
INNER JOIN dept_emp b
ON a.dept_no = b.dept_no
GROUP BY dept_name
ORDER BY dept_name;