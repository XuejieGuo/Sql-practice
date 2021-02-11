with t as (
    select *, row_number() over(order by x) as rowNo 
    from point
)
select min(abs(p1.x- p2.x) ) as shortest 
from t p1 
inner join t p2 
on p1.rowNo <> p2.rowNo

