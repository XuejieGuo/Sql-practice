WITH temp AS (
SELECT
    number,
    frequency,
    SUM(frequency) OVER(ORDER BY number) AS cum_sum,
    SUM(frequency) OVER() AS total
FROM numbers
),

temp2 AS (
SELECT
    *, 
    COALESCE(LAG(cum_sum) OVER(ORDER BY cum_sum), 0) AS start_n, 
    FLOOR((total - 1)/2) + 1 AS lower_end, 
    FLOOR(total / 2) AS higher_end
FROM temp
)
SELECT round(AVG(1.0*number),4) AS median
FROM temp2 
WHERE lower_end BETWEEN start_n AND cum_sum 
OR higher_end BETWEEN start_n AND cum_sum

