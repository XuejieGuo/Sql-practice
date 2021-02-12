with cte as(
SELECT substring(chargebacks.trans_date,1,7) AS month, country, "back" AS state, amount
FROM chargebacks
left join transactions 
    ON chargebacks.trans_id = transactions.id
UNION ALL
SELECT substring(trans_date,1,7) AS month, country, state, amount
FROM transactions
)

select month, country, 
       sum(if(state='approved',1,0)) as approved_count, 
       sum(if(state='approved',amount,0)) as approved_amount, 
       sum(if(state='back',1,0)) as chargeback_count, 
       sum(if(state='back',amount,0)) as chargeback_amount
from cte
group by 1,2
having approved_count+approved_amount+chargeback_count+chargeback_amount>0
