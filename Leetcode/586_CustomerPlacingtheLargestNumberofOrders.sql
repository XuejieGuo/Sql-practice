SELECT customer_number
FROM
(
    SELECT *, row_number() OVER (ORDER BY c DESC) AS rn
    FROM
    (
        SELECT customer_number, COUNT(*) AS c
        FROM orders
        GROUP BY customer_number
    ) a
) b
WHERE rn = 1

