SELECT city FROM station
WHERE SUBSTRING(city,-1,1) in ('a','e','i','o','u')
group by 1
