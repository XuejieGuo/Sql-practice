select UnitsSold.product_id, round(sum(units * price)/ sum(units),2) as average_price
from UnitsSold
left join Prices
on UnitsSold.product_id = Prices.product_id
and UnitsSold.purchase_date between Prices.start_date and Prices.end_date
group by 1
