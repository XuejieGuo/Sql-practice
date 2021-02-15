with cte as(
    select item_category, DAYNAME(order_date) as dayofweek, sum(quantity) as quantity
    from items  left join orders  on orders.item_id = items.item_id
    group by  item_category, DAYNAME(order_date) )
select item_category as Category
, sum(case when dayofweek = 'MONDAY' then quantity else 0 end) as MONDAY
, sum(case when dayofweek = 'TUESDAY' then quantity else 0 end) as TUESDAY
, sum(case when dayofweek = 'WEDNESDAY' then quantity else 0 end) as WEDNESDAY
, sum(case when dayofweek = 'THURSDAY' then quantity else 0 end) as THURSDAY
, sum(case when dayofweek = 'FRIDAY' then quantity else 0 end) as FRIDAY
, sum(case when dayofweek = 'SATURDAY' then quantity else 0 end) as SATURDAY
, sum(case when dayofweek = 'SUNDAY' then quantity else 0 end) as SUNDAY
from cte   group by item_category   order by item_category
