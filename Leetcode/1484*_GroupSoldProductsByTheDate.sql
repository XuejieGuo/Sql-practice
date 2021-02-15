select t.sell_date, count(t.product) num_sold, STRING_AGG(t.product,',') within group (order by t.product) products 
from (select distinct sell_date, product from activities) t   group by t.sell_date
