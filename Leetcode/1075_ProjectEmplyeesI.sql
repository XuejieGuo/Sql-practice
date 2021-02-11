select project_id, round(avg(convert(float,experience_years)),2) as average_years
from project
left join employee
on project.employee_id = employee.employee_id
group by project_id
order by 1
