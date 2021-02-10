SELECT dept_name, 
       (CASE WHEN c is null THEN 0 ELSE c END) AS student_number
FROM department
LEFT JOIN
(
    SELECT dept_id, COUNT(distinct student_id) AS c
    FROM student
    GROUP BY dept_id
) a
ON department.dept_id = a.dept_id
ORDER BY 2 DESC, 1
