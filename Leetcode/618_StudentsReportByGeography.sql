select America,Asia,Europe 
from
(
    select row_number() over(order by name) as id, name as america
    from student where continent = 'America'
) am 
FULL OUTER JOIN
(
    select row_number() over(order by name) as id, name as Asia
    from student where continent = 'Asia'
) a
ON am.id = a.id
FULL OUTER JOIN
(
    select row_number() over(order by name) as id, name as Europe
    from student where continent = 'Europe'
) u
on am.id = u.id;
