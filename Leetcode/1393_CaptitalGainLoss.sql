select stock_name,sum(ld-price) as capital_gain_loss
from( 		select * , lead(price) over(partition by stock_name order by operation_day) as ld
from stocks) a
where operation = 'buy'	
group by 1
