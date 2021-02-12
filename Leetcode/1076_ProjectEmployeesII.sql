select project_id from
(select project_id, dense_rank()over(order by count(employee_id) desc) as number 
 from Project
 group by project_id) a
where number=1
