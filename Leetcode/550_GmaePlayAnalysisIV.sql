SELECT
round(count(distinct player_id)/(select count(distinct player_id) FROM Activity),2) as fraction
FROM
(
    SELECT *
    FROM
        (
        SELECT *,
               rank() over(partition by player_id order by event_date) as rk,
               lead(event_date) over(partition by player_id order by event_date) as ld
        FROM Activity
        ) a
    WHERE rk = 1
) b
WHERE datediff(ld,event_date,day)=1
