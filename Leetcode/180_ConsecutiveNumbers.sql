WITH CTE AS(
SELECT num,
        lead(num) over(ORDER BY Id ASC) AS lead,
        lag(num) over(ORDER BY Id ASC) AS lag 
 FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums 
FROM CTE
WHERE num = lead 
  AND num = lag
