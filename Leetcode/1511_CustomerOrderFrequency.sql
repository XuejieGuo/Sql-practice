select a.customer_id, name
from(   select customer_id, substring(order_date,1,7) m, sum(quantity*price) spend
        from orders o left join product p on o.product_id = p.product_id
        where order_date between '2020-06-01' and '2020-07-31' 
        group by 1,2 having spend>=100) a
left join customers c on a.customer_id = c.customer_id
group by 1  having count(*)=2
