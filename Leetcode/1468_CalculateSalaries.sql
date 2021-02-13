select salaries.company_id, employee_id, employee_name, 
    case when top>10000 then round(salary*(1-0.49),0)
         when top<1000  then salary
         else round(salary*(1-0.24),0) end as salary
from salaries left join
        (select company_id, max(salary) top from salaries group by 1) a
on salaries.company_id = a.company_id
