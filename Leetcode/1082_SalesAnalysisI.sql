select seller_id
from
(
    select seller_id, dense_rank() over(order by total desc) as rk
    from
    (
        select seller_id, sum(price) as total
        from sales
        group by seller_id
    ) a
) b
where rk = 1
