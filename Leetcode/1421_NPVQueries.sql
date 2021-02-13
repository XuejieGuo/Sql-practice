select queries.id, queries.year, ifnull(npv,0) npv
from queries left join npv 	on queries.id = npv.id and queries.year = npv.year
