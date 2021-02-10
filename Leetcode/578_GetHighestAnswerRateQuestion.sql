WITH a AS(
    SELECT question_id, dense_rank() OVER (ORDER BY (num_answer/num_show) DESC) AS rk
    FROM
    (
        SELECT question_id,
               SUM(case when action='answer' THEN 1 ELSE 0 END) as num_answer,
               SUM(case when action='show' THEN 1 ELSE 0 END) as num_show    
        FROM survey_log
        GROUP BY question_id
    ) AS s
)
SELECT question_id AS survey_log
FROM a
WHERE rk = 1
