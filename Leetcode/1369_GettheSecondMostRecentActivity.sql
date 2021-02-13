select username, activity, startDate, endDate
from(
    select *
    from(select UserActivity.username, activity, startDate, endDate, c,
                row_number() over(partition by username order by endDate desc) as rn
         from UserActivity
         left join (select username,count(*)as c from UserActivity group by 1) a
         on a.username = UserActivity.username) b
    where c = 1 or rn = 2
) t
