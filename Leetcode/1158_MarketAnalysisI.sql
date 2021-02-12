select user_id as buyer_id, join_date, ifnull(c,0) as orders_in_2019
from users
left join(
        select buyer_id, count(*) as c
        from orders
        where year(order_date) = '2019'
        group by buyer_id) a
on a.buyer_id = users.user_id
