SELECT player_id, device_id
FROM
(
    SELECT player_id, device_id, row_number() OVER (PARTITION BY player_id 
                                                     ORDER BY event_date) AS rn
    FROM Activity
) AS a
WHERE rn = 1
