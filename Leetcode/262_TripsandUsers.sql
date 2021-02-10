WITH Unbanned AS(
    SELECT * 
    FROM Trips
    WHERE Client_Id NOT IN (
    SELECT Users_Id 
    FROM Users
    WHERE Banned = 'Yes'
  )
      AND Driver_Id NOT IN (
    SELECT Users_Id 
    FROM Users
    WHERE Banned = 'Yes'
  )
)

SELECT day,round( Cancellation/total::decimal, 2 ) AS Cancellation_Rate
FROM
(SELECT Request_at AS Day, 
       SUM( CASE WHEN (Status = 'completed') THEN 0 ELSE 1 END) AS Cancellation,
       COUNT(*)AS total
FROM Trips
GROUP BY 1
ORDER BY 1
) AS a
