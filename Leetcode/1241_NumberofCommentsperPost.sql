select a.sub_id as post_id, ifnull(c,0) as number_of_comments
from(
    select distinct sub_id
    from submissions
    where parent_id is null) a
left join (
    select parent_id, count( distinct sub_id) as c
    from Submissions
    group by parent_id) b
on a.sub_id = b.parent_id
order by 1
