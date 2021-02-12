select name as results
from( select name, row_number() over (order by c desc, name asc) as rn
      from( select movie_rating.user_id, name, count(distinct movie_id) as c
            from movie_rating left join users
            on movie_rating.user_id = users.user_id
            group by 1) a
) b  where rn = 1
union
select title as results 
from( select c.movie_id,title,row_number()over(order by avr desc, title asc) rn
      from( select movie_id, avg(rating) as avr
            from movie_rating
            where created_at between '2020-02-01' and '2020-02-29'
            group by 1) c
      left join movies on movies.movie_id = c.movie_id) d where rn = 1
