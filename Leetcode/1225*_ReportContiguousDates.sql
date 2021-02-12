with cte1 as(
    select state, d,
                     CASE WHEN state = LAG(state) OVER(ORDER BY d) THEN NULL 
                          ELSE 'start_date' END AS start_d,
                     CASE WHEN state = LEAD(state) OVER(ORDER BY d) THEN NULL 
                          ELSE 'end_date' END AS end_d
    from(
        select 'failed' as state, fail_date as d from failed
        union 
        select 'succeeded' as state, success_date as d from succeeded
    ) a
    where d between '2019-01-01' and '2019-12-31'
)
select t1.state as period_state, start_date, end_date
from(
    select state, d as start_date, dense_rank() over (order by d) as rk
    from cte1 
    where start_d = 'start_date') t1
inner join(
    select state, d as end_date, dense_rank() over (order by d) as rk
    from cte1 
    where end_d = 'end_date') t2
on t1.rk = t2.rk
