SELECT Name 
FROM Customers
WHERE Id NOT IN (
  SELECT CustomerId
  FROM Orders
  GROUP BY 1)
