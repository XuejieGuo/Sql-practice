select t.id, name
from(  select distinct a.id from Logins a cross join Logins b 
       on a.id=b.id AND DATEDIFF(a.login_date, b.login_date) between 1 and 4
       GROUP BY a.id,a.login_date HAVING COUNT(distinct b.login_Date)=4)t
left join accounts on t.id = accounts.id order by 1
