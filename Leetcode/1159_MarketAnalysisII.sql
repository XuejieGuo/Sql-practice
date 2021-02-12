select user_id as seller_id, 
       if(favorite_brand = second,'yes','no')as 2nd_item_fav_brand
from users
left join(
        select seller_id, second
        from(
            select seller_id, items.item_brand as second,
                  dense_rank() over (partition by seller_id order by order_date) as rk
            from orders
            left join items
            on orders.item_id = items.item_id
            ) a
        where rk = 2
) b
on users.user_id = b.seller_id
