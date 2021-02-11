 with a as (
    select salary.employee_id as employee_id, 
           amount, Left(pay_date, 7) as pay_month, department_id
    from salary
    left join employee
    on salary.employee_id = employee.employee_id
    ),
cte as(
    select pay_month, department_id, avg(amount) as d_avg
    from a
    group by pay_month, department_id
),
b as(
    select pay_month, avg(amount) as a_avg
    from a
    group by pay_month
)
select cte.pay_month as pay_month, department_id,
       case when d_avg < a_avg then 'lower'
            when d_avg > a_avg then 'higher'
            else 'same' end as comparison
from cte
left join b
on cte.pay_month = b.pay_month
