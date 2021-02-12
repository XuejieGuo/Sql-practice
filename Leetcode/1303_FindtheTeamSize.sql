select employee_id, team_size
from employee
left join (
        select team_id, count(*) as team_size
        from Employee
        group by team_id)a
   on employee.team_id = a.team_id
