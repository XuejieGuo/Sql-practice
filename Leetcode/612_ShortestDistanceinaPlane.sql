with t as (
    select *, row_number() over(order by x,y) as rowNo 
    from point_2d
)
select round(min(sqrt(power((p1.x- p2.x),2) + power((p1.y- p2.y),2)) ),2) as shortest from t p1 
inner join t p2 
on p1.rowNo <> p2.rowNo
