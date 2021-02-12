with t as(
select activity, dense_rank() over(order by c desc) as rk
from( select activity, count(*) as c from friends group by 1) a
) 
select activity from t
where rk != 1 and rk != (select max(rk) from t)
