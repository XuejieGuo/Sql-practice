with l1 as(
    select employee_id 
    from Employees
    where manager_id = 1 and employee_id != 1
),
l2 as(
    select employee_id 
    from Employees
    where manager_id in (select * from l1)
)
select * from l1
union
select * from l2
union
select employee_id 
from Employees
where manager_id in (select * from l2)
