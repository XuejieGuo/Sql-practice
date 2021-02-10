WITH l AS(
SELECT Name, Salary, DepartmentId 
FROM(
    SELECT *, dense_rank() OVER (PARTITION BY DepartmentId 
                           ORDER BY Salary DESC) AS rk
    FROM Employee
) AS a
WHERE rk < 4
)

SELECT Department.Name AS Department, 
       l.Name AS Employee,
       Salary
FROM l
INNER JOIN Department
ON l.DepartmentId = Department.Id
