with a as (
    select user_id, transaction_date, count(*) as tc
    from transactions
    group by 1,2),
b as(
    select t_count, count(*) as visits_count
    from(
        select visits.user_id, visit_date, ifnull(tc,0) as t_count
        from visits
        left join a
         on a.user_id = visits.user_id and a.transaction_date = visits.visit_date) t
    group by 1),
c as( select 0 as rk union select row_number() over() as rk from Transactions)

select rk as transactions_count, ifnull(visits_count,0) visits_count
from c
left join b
on rk = t_count
where rk<= (select max(t_count) from b)
