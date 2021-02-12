select round(ifnull(avg(cnt),0),2) as average_sessions_per_user
from(
    select user_id, count(distinct session_id) cnt
    from activity
    where datediff('2019-07-27',activity_date)<30
      and datediff('2019-07-27',activity_date)>=0
    group by user_id
) a
