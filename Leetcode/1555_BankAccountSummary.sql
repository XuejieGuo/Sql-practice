select *, if(credit>0,'No','Yes') as credit_limit_breached 
from(   select user_id, user_name, ifnull(cre+amount,cre) as credit
        from (  select user_id, user_name, ifnull(credit-amount,credit) cre 
                from users  left join (select paid_by,sum(amount) as amount 
                                       from Transactions group by 1) t1 
                on users.user_id = t1.paid_by ) a
        left join( select paid_to,sum(amount) amount from Transactions group by 1) t2         on t2.paid_to = a.user_id) b
