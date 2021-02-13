select name,ifnull(sd,0) as travelled_distance
from( select user_id, sum(distance) as sd  from rides group by 1) a
right join users	    on a.user_id = users.id
order by 2 desc, 1 asc
