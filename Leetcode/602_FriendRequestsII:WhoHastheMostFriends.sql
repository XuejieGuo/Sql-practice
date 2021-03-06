select id, counts as num 
from (
    select id, counts,
            dense_rank() over(order by counts desc) as dr
    from (
        select id, count(*) as counts 
        from (
            select requester_id as id from request_accepted
            union all 
            select accepter_id as id from request_accepted
        ) a 
        group by id
    ) b 
) c 
where c.dr = 1
