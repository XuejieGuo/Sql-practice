SELECT a1.Name FROM Employee a1
INNER JOIN Employee a2
ON a1.ManagerId = a2.Id
WHERE a1.Salary > a2.Salary
