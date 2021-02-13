select left_operand, operator, right_operand, 
       CASE WHEN (operator='>' AND ll > rr) OR (operator='=' AND ll = rr)
            OR (operator='<' AND ll < rr) THEN 'true' ELSE 'false' END value
from(   select ll, left_operand, operator, right_operand, value as rr
        from Variables 
        right join( select value as ll, left_operand, operator, right_operand
                    from Expressions left join Variables
                    on Expressions.left_operand = Variables.name) r
        on Variables.name = r.right_operand) a
