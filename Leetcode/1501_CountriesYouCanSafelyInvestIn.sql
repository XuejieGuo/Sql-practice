with cte as(
    select p, avg(duration) as local_avg
    from(
        select substring(phone_number,1,3) as p, duration
        from calls left join person on person.id = calls.caller_id 
        union all
        select substring(phone_number,1,3) as p, duration
        from calls left join person on person.id = calls.callee_id ) a
    group by 1)
select name as country from(
  select p from( 
       select * from cte  cross join (select avg(duration) as global_avg from calls) b
) c  
  where local_avg > global_avg) d 
left join country on d.p = country.country_code
