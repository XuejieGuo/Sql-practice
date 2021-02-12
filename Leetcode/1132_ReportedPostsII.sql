SELECT ROUND(AVG(avg_p), 2) AS average_daily_percent
FROM (
      SELECT action_date, 
     (COUNT(distinct Removals.post_id)/COUNT(distinct Actions.post_id)*100) AS avg_p
      FROM Actions
      LEFT JOIN Removals 
      ON Actions.post_id = Removals.post_id
      WHERE extra='spam'
      GROUP BY 1
) a
