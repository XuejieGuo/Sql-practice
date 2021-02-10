DELETE FROM Person 
WHERE Id NOT IN 
  (SELECT MIN(Id) 
   FROM Person 
   GROUP BY Email
);
