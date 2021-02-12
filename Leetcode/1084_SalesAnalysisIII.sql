select a.product_id, product_name 
from (
    select product_id, 
           sum(case when sale_date >= '2019-01-01' and sale_date <= '2019-03-31' 
                    then 0 else 1 end) as dt 
    from sales
    group by product_id
    ) a
left join product 
on a.product_id = product.product_id
where dt = 0
