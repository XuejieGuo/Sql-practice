WITH s1 AS(
  SELECT count(*) 
  FROM seat
),
s2 AS(
  SELECT * 
  FROM seat 
  CROSS JOIN s1
),
f AS(
  SELECT *, (CASE WHEN id %2 = 1 AND id != count THEN id+1 
                  WHEN id %2 = 0 THEN id-1
                  ELSE id END) AS nid
FROM s2
)

SELECT nid AS id, students
FROM f
ORDER BY 1 ASC


SELECT 
  id,
  if(mod(id,2)!=0 and lead is null, name, 
      if(mod(id,2)!=0 and lead is not null, 
         lead,  
         lag) as name
FROM
  (select *, lag(name,1) over(order by id) as lag, lead(name,1) over(order by id) as lead from tbl)
