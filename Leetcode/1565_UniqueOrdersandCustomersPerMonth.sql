select DATE_FORMAT(order_date,'%Y-%m') as month, count(distinct order_id) as order_count, count(distinct customer_id) as customer_count
from orders     where invoice>20    group by 1
