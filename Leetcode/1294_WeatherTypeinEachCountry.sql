select country_name, case when w <= 15 then 'Cold'
                          when w >= 25 then 'Hot'
                          else 'Warm' end as weather_type
from(
    select country_id, avg(weather_state) as w
    from weather
    where day between '2019-11-01' and '2019-11-30'
    group by 1) a
left join countries
on a.country_id = countries.country_id
