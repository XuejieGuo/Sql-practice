WITH a AS(   
    SELECT *, dense_rank() OVER (PARTITION BY Id ORDER BY Month DESC) as rk
    FROM Employee
)
SELECT Id, Month, SUM(Salary) OVER (PARTITION BY Id ORDER BY Month ASC) AS Salary
FROM 
(
    SELECT * 
    FROM a
    WHERE rk != 1
) b
ORDER BY 1 ASC, 2 DESC
