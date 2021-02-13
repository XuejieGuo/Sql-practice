select l.customer_id, customer_name
from(
  select a.customer_id
  from (select customer_id from orders where product_name = 'A') a
  inner join (select customer_id from orders where product_name = 'B') b
  on a.customer_id = b.customer_id
  where a.customer_id not in (select customer_id from orders where product_name = 'C')
)l left join customers on l.customer_id = customers.customer_id
