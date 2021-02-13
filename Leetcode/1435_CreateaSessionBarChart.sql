with sbq as (select case when duration/60 >= 0 and duration/60 < 5 then '[0-5>'
						 when duration/60 >= 5 and duration/60 < 10 then '[5-10>'
                         when duration/60 >= 10 and duration/60 < 15 then '[10-15>'
                         else '15 or more'end as bin, count(*) as total 
             from sessions  group by bin
union  select '[0-5>', 0   union   select '[5-10>', 0   union   select '[10-15>', 0
union  select '15 or more', 0)  
select bin, max(total) as total from sbq group by bin
