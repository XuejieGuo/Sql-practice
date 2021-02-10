SELECT now.Id
FROM Weather now
LEFT JOIN Weather pre
ON DATE_PART('Day', now.RecordDate) - DATE_PART('Day', pre.RecordDate) = 1
WHERE pre.Temperature < now.Temperature
