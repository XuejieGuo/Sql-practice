select ad_id, ifnull(round(sum(if(action='Clicked',1,0))*100/sum(if(action!='Ignored',1,0)),2),0) as ctr
from ads
group by ad_id
order by 2 desc, 1 asc
