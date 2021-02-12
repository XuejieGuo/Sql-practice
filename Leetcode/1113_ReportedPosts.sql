select extra as report_reason,
       count(distinct post_id) as report_count
from actions
where datediff('2019-07-05', action_date) = 1 
  and action = 'report'
group by 1
