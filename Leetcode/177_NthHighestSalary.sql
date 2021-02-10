SELECT Salary AS SecondHighestSalary 
FROM
(SELECT *, dense_rank() OVER (ORDER BY Salary DESC) AS rk
 FROM Employee
) AS a
WHERE N = 2
LIMIT 1
