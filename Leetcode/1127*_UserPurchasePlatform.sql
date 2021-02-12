select b.spend_date,b.platform,
       ifnull(sum(a.amount),0) as total_amount, 
       ifnull(count(a.user_id),0) as total_users
from(
    select spend_date,user_id,'both'as platform,sum(amount) as amount
    from Spending
    group by spend_date,user_id
    having count(distinct platform)=2
    union
    select spend_date,user_id,platform,amount
    from Spending
    group by spend_date,user_id
    having count(distinct platform)=1
) a
right join(
    SELECT DISTINCT(spend_date), 'desktop' platform FROM Spending
    UNION
    SELECT DISTINCT(spend_date), 'mobile' platform FROM Spending
    UNION
    SELECT DISTINCT(spend_date), 'both' platform FROM Spending) b
on a.spend_date=b.spend_date and a.platform=b.platform 
group by 1,2
order by 1,2
