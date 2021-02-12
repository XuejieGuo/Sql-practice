SELECT Books.book_id, Books.name
FROM Books
LEFT JOIN Orders
ON Books.book_id = Orders.book_id
WHERE DATEDIFF( '2019-06-23', Books.available_from) > 30
GROUP BY Books.book_id
HAVING SUM(CASE WHEN dispatch_date > '2018-06-23' 
                THEN Orders.quantity ELSE 0 END) < 10 
OR SUM(Orders.quantity) IS NULL;
