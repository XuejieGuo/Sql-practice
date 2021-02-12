select visited_on, amount, round(amount/7,2) as average_amount
from(
    SELECT visited_on, sum(amount) over(order by visited_on rows between 6 preceding and current row) as amount, row_number() over (order by visited_on) as rk
    from (SELECT visited_on, SUM(amount) as amount FROM Customer GROUP BY 1) a
    GROUP BY 1)b
where rk >= 7
