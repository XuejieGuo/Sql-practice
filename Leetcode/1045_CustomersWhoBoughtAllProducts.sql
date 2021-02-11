select customer_id
from(
    select customer_id, count(distinct product_key) c
    from customer
    group by customer_id
) a
where c = (select count(*) from product )
