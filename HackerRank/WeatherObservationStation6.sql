SELECT city FROM station
WHERE SUBSTRING(city,1,1) in ('A','E','I','O','U')
group by 1
