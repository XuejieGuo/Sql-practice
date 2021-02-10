SELECT Email
FROM
(
  SELECT Email, count(id) AS num
  FROM person
  GROUP BY 1
) AS a
WHERE num > 1
