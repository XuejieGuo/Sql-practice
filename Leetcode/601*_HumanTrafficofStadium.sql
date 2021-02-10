SELECT id, visit_date, people 
FROM
(
    SELECT id, visit_date, people, 
            lead(people) OVER (ORDER BY id) ld1,
            lead(people, 2) OVER (ORDER BY id) ld2,
            lag(people) OVER (ORDER BY id) lg1,
            lag(people, 2) OVER (ORDER BY id) lg2
    FROM stadium        
)  AS a
WHERE people >= 100 
  AND (  (ld1 >=100 AND ld2 >=100)   
       OR(lg1 >=100 AND lg2 >=100) 
       OR(ld1 >= 100 AND lg1 >=100)
      )
