select product_id, year as first_year, quantity, price
from
(
    select *, dense_rank() over (partition by product_id order by year) as rk
    from sales
) a
where rk = 1
