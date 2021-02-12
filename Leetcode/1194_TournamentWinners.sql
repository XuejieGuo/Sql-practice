select group_id,player_id
from(
    select player_id, group_id, s, 
           row_number() over(partition by group_id order by s desc, player asc) as rn
    from players
    left join(
        select player, sum(score) as s
        from(
            select first_player as player, first_score as score
            from Matches
            union all
            select second_player as player, second_score as score
            from Matches
        ) a
        group by 1
    )b
    on players.player_id = b.player
) c
where rn = 1
