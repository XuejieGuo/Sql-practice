select a.student_id, a.student_name, a.subject_name, ifnull(times,0) attended_exams
from(   
    select *
    from students
    cross join subjects) a
left join(
    select student_id, subject_name, count(*) as times
    from Examinations
    group by 1,2
) b
on a.student_id = b.student_id and a.subject_name = b.subject_name
order by 1,3
