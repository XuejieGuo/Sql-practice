WITH sent AS (
    SELECT count(distinct concat(sender_id, send_to_id)) AS sent 
    FROM friend_request),
accepted AS (
    SELECT count(distinct concat(requester_id, accepter_id)) AS accepted 
    FROM request_accepted)

SELECT case when sent = 0 then 0 
            else round(convert(float, accepted) / sent, 2) end as accept_rate
from sent, accepted
