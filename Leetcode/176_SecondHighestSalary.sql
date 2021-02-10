SELECT Salary AS SecondHighestSalary 
FROM
(SELECT *, dense_rank() OVER (ORDER BY Salary DESC) AS rk
 FROM Employee
) AS a
WHERE rk = 2
LIMIT 1
