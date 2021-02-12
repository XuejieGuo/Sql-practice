SELECT person_name
FROM(
    SELECT person_name,
           SUM(weight) OVER (order by turn) AS running_total
    FROM Queue
) a
WHERE a.running_total <= 1000
ORDER BY a.running_total DESC LIMIT 1
