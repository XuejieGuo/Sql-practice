with cte as(
    select * from sales
    where period_start between '2018-01-01' and '2020-12-31'),
cte1 as(
    select product_id, substring(period_end,1,4) as y,      
           (datediff(period_end,period_start)+1)*average_daily_sales as ta
    from cte where substring(period_end,1,4) = substring(period_start,1,4)
),
cte2 as(
    select product_id, substring(period_start,1,4) as y,      
           (datediff(concat(substring(period_start,1,4),'-12-31'),period_start)+1)*average_daily_sales as ta
    from cte where substring(period_end,1,4)-substring(period_start,1,4)=1
    union all
    select product_id, substring(period_end,1,4) as y,      
           (datediff(period_end,concat(substring(period_end,1,4),'-01-01'))+1)*average_daily_sales as ta
    from cte where substring(period_end,1,4)-substring(period_start,1,4)=1
),
cte3 as(
    select product_id, '2018' as y, (datediff('2018-12-31',period_start)+1)*average_daily_sales as ta
    from cte where substring(period_end,1,4)-substring(period_start,1,4)=2
    union all
    select product_id, '2019' as y, 365*average_daily_sales as ta
    from cte where substring(period_end,1,4)-substring(period_start,1,4)=2
    union all
    select product_id, '2020' as y, (datediff(period_end,'2020-01-01')+1)*average_daily_sales as ta
    from cte where substring(period_end,1,4)-substring(period_start,1,4)=2
)
select a.product_id, product_name, y as report_year, sum(ta) as total_amount
from(
    select * from cte1 union all select * from cte2 union all select * from cte3
) a
left join product on a.product_id = product.product_id
group by 1,2,3
order by 1,3
