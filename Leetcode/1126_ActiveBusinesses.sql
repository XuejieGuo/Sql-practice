SELECT business_id 
FROM(
    SELECT *, case when occurences > AVG(occurences) OVER(PARTITION BY event_type) then 1 else 0 end x
    FROM Events)  sub
GROUP BY business_id
HAVING SUM(x) > 1
