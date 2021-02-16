select city, l from
(select *, row_number() over(order by l, city) as rn
 from(select city, length(city) as l  from station) a1) b1
 where rn = 1
 union
 select city, l from
(select *, row_number() over(order by l desc, city) as rn
 from(select city, length(city) as l  from station ) a2) b2
 where rn = 1
