with a as( select *, dense_rank() over(partition by exam_id order by score desc) hrk,
                     dense_rank() over(partition by exam_id order by score asc) lrk
       from exam)
select l.student_id, student_name
from( select distinct student_id from exam
      where student_id not in(select distinct student_id from a where lrk=1 or hrk=1)
       and student_id in (select distinct student_id from exam) 
       )l  
left join student  on l.student_id = student.student_id   order by student_id
