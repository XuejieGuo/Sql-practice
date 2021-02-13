with a as(         select user_id, count(distinct contact_email) as c_cnt
    		from Contacts 
    		group by 1),
b as(	   select user_id, count(distinct contact_email) as t_cnt
   	   from Contacts 
    	   where contact_email in (select email from Customers group by 1)
               group by 1),
c as( select invoice_id, price, customer_name, Invoices.user_id
        from Invoices
        left join Customers on Invoices.user_id = Customers.customer_id)

select invoice_id, customer_name, price, contacts_cnt, ifnull(t_cnt,0) as trusted_contacts_cnt
from(  select invoice_id, price, customer_name, c.user_id, ifnull(c_cnt,0) as contacts_cnt
           from c left join a on c.user_id = a.user_id) d
left join b on d.user_id = b.user_id
order by 1
