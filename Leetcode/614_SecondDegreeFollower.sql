select followee as follower, count(distinct follower) as num
from follow
where followee in (select distinct follower from follow a)
group by followee
order by 1
