SELECT score, dense_rank() OVER (ORDER BY score DESC) AS Rank
FROM Scores
