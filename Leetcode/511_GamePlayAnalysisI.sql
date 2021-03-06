SELECT player_id, event_date AS first_login
FROM
(
    SELECT player_id, event_date, row_number() OVER (PARTITION BY player_id 
                                                     ORDER BY event_date) AS rn
    FROM Activity
) AS a
WHERE rn = 1
