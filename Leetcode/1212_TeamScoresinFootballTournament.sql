select teams.team_id, teams.team_name, ifnull(l.num_points,0) as num_points
from(
    select team_id, sum(points) as num_points
    from(
        select host_team as team_id, case when host_goals > guest_goals then 3
                                          when host_goals = guest_goals then 1
                                          else 0 end as points
        from matches
        union all
        select guest_team as team_id, case when host_goals < guest_goals then 3
                                           when host_goals = guest_goals then 1
                                           else 0 end as points
        from matches
    ) a
    group by 1
) l
right join teams
on l.team_id = teams.team_id
order by 3 desc, 1 asc
