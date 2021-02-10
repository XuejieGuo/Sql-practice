DELETE FROM Person 
WHERE Id NOT IN
(
SELECT Id 
FROM
  (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY Email ORDER BY Id ASC) AS rn
  FROM Person
  ) AS a
WHERE rn=1
)