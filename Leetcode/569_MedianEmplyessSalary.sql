WITH a AS(
SELECT *, row_number() OVER(PARTITION BY Company ORDER BY Salary) AS rn 
FROM Employee
),
b AS(
SELECT Company,
       floor((count(*)+1)/2) as floor,
       ceiling((count(*)+1)/2) as ceil     ---- 直接((count(*)+2)/2)
FROM Employee
GROUP BY Company
)

SELECT a.Id, a.Company, a.Salary
FROM a 
INNER JOIN b
ON a.Company = b.Company
WHERE a.rn >= b.floor AND a.rn <= b.ceil	
