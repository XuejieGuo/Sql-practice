select event_date install_dt, count(distinct(player_id)) installs,
       round(sum(dt_diff)/count(distinct(player_id)),2) as Day1_retention
from (
    select player_id, event_date, lg,
           case when datediff(lg,event_date) = 1 then 1 else 0 end as dt_diff
    from (
        select player_id, event_date, dense_rank() over (partition by player_id
                                                         order by event_date) rnk,
               lead(event_date) over (partition by player_id
                                      order by event_date) lg
        from activity
        ) a
    where rnk=1
    ) b
group by 1
