with a as( 
    select buyer_id, product_name
    from sales
    left join product
    on sales.product_id = product.product_id
)
select distinct buyer_id
from a
where product_name = 'S8'
  and buyer_id not in (
                    select distinct buyer_id
                    from a where product_name = 'iPhone')
