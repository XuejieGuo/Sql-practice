select name as customer_name, Customers.customer_id, order_id, order_date
from Customers left join (   
    select *, row_number() over(partition by customer_id order by order_date desc) rn
    from orders) a  on Customers.customer_id = a.customer_id  where rn<=3
order by 1 asc, 2 asc,4 desc
