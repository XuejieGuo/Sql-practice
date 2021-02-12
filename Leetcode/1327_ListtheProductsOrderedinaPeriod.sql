select  product_name, unit
from(select product_id, sum(unit) as unit
    from orders
    where order_date between '2020-02-01' and '2020-02-29'
    group by 1
    having unit>= 100)a
left join products on a.product_id = products.product_id
