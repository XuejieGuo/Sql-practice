select activity_date as login_date, count(distinct user_id) as user_count
from(
    select *, dense_rank() over(partition by user_id order by activity_date) as rk
    from traffic
    where activity = 'login'
) a
where datediff('2019-06-30', activity_date)<=90
 and  rk = 1
group by activity_date
