select * from(
select a.id p1, b.id p2, abs(a.x_value-b.x_value)*abs(a.y_value-b.y_value) area
from points a	cross join points b	on a.id < b.id	order by 3 desc, 1 asc, 2 asc) t where area >0
