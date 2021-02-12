select round(sum(if(order_date=customer_pref_delivery_date,1,0))*100/count(*),2) as immediate_percentage
from(
    select *, row_number() over (partition by customer_id order by order_date) as rn
    from delivery
)a
where rn = 1
