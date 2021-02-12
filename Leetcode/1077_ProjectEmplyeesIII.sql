select project_id, employee_id
from(
select project_id, project.employee_id, 
     dense_rank() over(partition by project_id order by experience_years desc) as dr
from project
left join employee
on project.employee_id = employee.employee_id
) a
where dr = 1
