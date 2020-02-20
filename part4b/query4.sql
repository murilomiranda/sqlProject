-- What percentage of employees are Female?

SELECT gender, CAST(COUNT(*)/CAST(SUM(COUNT(*)) OVER () AS FLOAT) AS DECIMAL(10, 3)) AS perc FROM employees
GROUP BY gender;