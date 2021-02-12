select ids.product_id as product_id, ifnull(b.price,10) as price
from(
    select distinct product_id
    from products) ids
left join(
    select product_id, new_price as price
    from(
        select *, 
            row_number() over(partition by product_id order by change_date desc)as rn
        from products
        where change_date<='2019-08-16'
    )a
    where rn = 1
)b
on ids.product_id = b.product_id
