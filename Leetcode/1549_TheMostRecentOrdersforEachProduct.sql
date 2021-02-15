select product_name, products.product_id, order_id, order_date
from products left join (   
    select *, rank() over(partition by product_id order by order_date desc) rk
from orders) a  on products.product_id = a.product_id  where rk=1	order by 1,2,3
